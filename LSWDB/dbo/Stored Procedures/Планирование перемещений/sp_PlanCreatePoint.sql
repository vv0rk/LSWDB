/*
	создает точку на временной оси с новым состоянием устройства 
	или с новым устройством пока еще не купленым но уже запланированным для покупки
	для вновь закупаемых устройств необходимо создавать устройства в Lansweeper
	для планируемых устройств AssetUnique = typename_id
	state = Plan
	AssetName = Model_id
	Model = модель из справочника

	@tgtAssetId - 
	@AssetId устанавливают на место @tgtAssetId
	@tgtAssetId перемещают на склад
*/
CREATE PROCEDURE [dbo].[sp_PlanCreatePoint]
	@AssetId int = NULL,
	@idState int = 1,
	@tgtAssetId int = NULL,
	@idDeviceClass int = NULL,

	@Org nvarchar(50) = NULL,
	@Filial nvarchar(50) = NULL,
	@Gorod nvarchar(255) = null,
	@Address nvarchar(255) = null,
	@Office nvarchar(255) = null,
	@idEmployee int = null,
	@idOU int = null,
	@ExDate datetime = null
AS
	declare @id int = null;
	declare @idd int = null;
	declare @AssetUnique nvarchar(150) = null;
	declare @AssetName nvarchar(150) = null;
	declare @AssetType int = null;
	declare @AssetState int = null;
	declare @AssetModel nvarchar(255) = null

	IF @tgtAssetId is null
		begin
			IF @org is null or @Gorod is null or @Address is null 
				begin 
					raiserror(N'Необходимо определить Организацию, Филиал, Город, Адрес', 10, 1);
					return 1;
				end 
		end
	ELSE
		begin 
			Select 
				@Org = c.Parent,
				@Filial = ac.custom1,
				@gorod = ac.custom2,
				@Address = ac.Custom3,
				@Office = ac.custom4
			from tblAssetCustom as ac 
			inner join rCompany$ as c on ac.Custom1 = c.Code
			Where ac.AssetID = @tgtAssetId;
		end

	IF @AssetId is null
		begin
			-- это закупается новое устройство, если дата не указана ставим 1ое число 2го квартала следующего года (ПЛАН)
			IF @idDeviceClass is null 
				begin 
					raiserror(N'Необходмо определить класс устройства.', 10, 1);
					return 1;
				end 

			Select @AssetState = s.State from tblState as s where s.Statename like N'Plan';

			IF @ExDate is null
				begin
					declare @w nvarchar(20);
					Set @w = year(getdate()) + 1;
					Set @w = @w + + '06' + '01';
					Set @ExDate = Convert(datetime, @w, 112);
					print @ExDate
				end
			
			-- создали точку для нового устройства
			insert into rPlanTimeSheet (idState, idDeviceClass, ExDate, Org, Filial, Address, Office, isAttention)
			values (1, @idDeviceClass, @ExDate, @Org, @Filial, @Address, @Office, 1);
			set @id = @@IDENTITY

			Select @AssetType = t.AssetType, @AssetModel = s.partNumber
				from rSpravochnik as s
				inner join tsysAssetTypes as t on s.idAssetType = t.AssetType
				where s.Id = @idDeviceClass

			Set @AssetUnique = convert(nvarchar(10), @AssetType) + N'_' + convert(nvarchar(10), @AssetState) + N'_' + convert(nvarchar(10), @id)
			Set @AssetName = @AssetUnique

			-- создали Асет для нового устройства
			insert into dbo.tblAssets (AssetUnique, Assettype, AssetTypeLock, AssetName)
			VALUES (@AssetUnique, @AssetType, 1, @AssetName)
			Set @AssetId = @@IDENTITY

			insert into dbo.tblAssetCustom(AssetID, State, Model, ModelLock, Custom1, Custom2, Custom3, Custom4)
			values (@AssetId, @AssetState, @AssetModel, 1, @Filial, @Gorod, @Address, @Office)

			-- дополнили точку нового устройства AssetId
			update dbo.rPlanTimeSheet 
			set dbo.rPlanTimeSheet.AssetId = @AssetId
			Where dbo.rPlanTimeSheet.Id = @id;
			

			-- создаем устройство на временной оси
			IF @tgtAssetId is not null 
				begin
					declare @tgtId int = null;
					-- получаем targetId
					Select @tgtId = p.Id from rPlanTimeSheet as p where p.AssetId = @tgtAssetId;
					-- создаем запись для нового устройства
					--insert into rPlanTimeSheet (AssetId, idState, idDeviceClass, ExDate, Org, Filial, Address, Office, isAttention, tgtId)
					--values (@AssetId, 1, @idDeviceClass, @ExDate, @Org, @Filial, @Address, @Office, 1, @tgtId);
					--Set @id = @@IDENTITY;
					-- создаем точку для заменяемого устройства
					insert into rPlanTimeSheet (AssetId, idState, tgtId, srcId, ExDate, Org, Filial, Address, Office, idEmployee, idOU)
					select p.AssetId, 9, p.tgtId, @id, @ExDate, p.Org, p.Filial, p.Address, p.Office, p.idEmployee, p.idOU
						from (
						select ROW_NUMBER() over (partition by p.AssetId order by p.exdate desc) as num,
						p.AssetId, p.idState, p.tgtId, @id as srcId, @ExDate as ExDate, p.Org, p.Filial, p.Address, p.Office, p.idEmployee, p.idOU
						from rPlanTimeSheet as p) as p
						where p.AssetId = @tgtAssetId and p.num = 1;

					Set @idd = @@IDENTITY;
					-- модифицируем точку для нового устройства
					update rPlanTimeSheet 
					set rPlanTimeSheet.tgtId = @idd
					where rPlanTimeSheet.Id = @id;
				end
		end
	ELSE
		begin
			-- это существующее устройство
			Select @AssetState = s.State from tblState as s where s.Statename like N'Plan';

			IF @ExDate is null
				begin
					Set @w = year(getdate()) + 1;
					Set @w = @w + + '06' + '01';
					Set @ExDate = Convert(datetime, @w, 112);
					--print @ExDate
				end
			
			-- создали точку для устройства которое ставим в работу
			insert into rPlanTimeSheet (AssetId, idState, ExDate, Org, Filial, Address, Office, isAttention)
			values (@AssetId, 1, @ExDate, @Org, @Filial, @Address, @Office, 1);
			set @id = @@IDENTITY

			-- создаем устройство на временной оси
			IF @tgtAssetId is not null 
				begin
					-- получаем targetId
					Select @tgtId = p.Id from rPlanTimeSheet as p where p.AssetId = @tgtAssetId;
					-- создаем точку для заменяемого устройства
					insert into rPlanTimeSheet (AssetId, idState, tgtId, srcId, ExDate, Org, Filial, Address, Office, idEmployee, idOU)
					select p.AssetId, 9, p.tgtId, @id, @ExDate, p.Org, p.Filial, p.Address, p.Office, p.idEmployee, p.idOU
						from (
						select ROW_NUMBER() over (partition by p.AssetId order by p.exdate desc) as num,
						p.AssetId, p.idState, p.tgtId, @id as srcId, @ExDate as ExDate, p.Org, p.Filial, p.Address, p.Office, p.idEmployee, p.idOU
						from rPlanTimeSheet as p) as p
						where p.AssetId = @tgtAssetId and p.num = 1;

					Set @idd = @@IDENTITY;
					-- модифицируем точку для нового устройства
					update rPlanTimeSheet 
					set rPlanTimeSheet.tgtId = @idd
					where rPlanTimeSheet.Id = @id;
				end
		end
RETURN 0
