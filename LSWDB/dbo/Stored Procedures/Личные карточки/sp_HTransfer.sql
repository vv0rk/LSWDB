/*
	хранимые процедуры по которым производится движение оборудования по ЛК
	16/09/2017 Savin Nikolay
	добавил функционал
	если назначаем ассет из lansweeper, то сначала создаем asset в rAssetsKsu и rAssetsImported
	затем производим назначение этого ассета на склад.
*/

/*
	Хранилище фиксируется в rAssetsImported столбец rScl
	функция для внесения данных о перемещении в журнал
	idAsset - идентификатор записи в rAssetsImported
	idScl1 - это атрибуты источника
	idScl2 - это атрибуты назначения
*/
CREATE procedure sp_HTransfer (	
									@idAsset int = NULL, 
									@idScl2 int = NULL,
									@AssetId int = NULL
									)

AS
	BEGIN
		declare @idScl1 int;
		declare @idJprev int;
		declare @idJ int;
		declare	@userCreate nvarchar(255) = NULL;
		declare @dateCreate datetime = NULL;
		declare @sclStatus1 int = NULL;
		declare @sclStatus2 int = null;

		SELECT @userCreate = SYSTEM_USER, @dateCreate = GETDATE()


		-- если отсутствует склад то завершаем 
		-- проверка условия целевой склад или асет не могут отсутствовать
		IF @idScl2 is null 
			BEGIN
				PRINT N'Назначение и Ассет не могут быть NULL';
				Raiserror ( N'Целевое хранилище должна быть определено при перемещении!', 18, 1);
				return 1;
			END

		-- если отсутствует @idAsset и @AssetId, завершаем аварийно
		IF @AssetId is null and @idAsset is null
			BEGIN
				PRINT N'Назначение и Ассет не могут быть NULL';
				Raiserror ( N'Асет должен быть определен при перемещении!', 18, 1);
				return 1;
			END

		-- если задан ассет из Lansweeper, то сначала создаем запись в rAssetsImported
		IF @AssetId is not null and @idAsset is null
			BEGIN
			-- вставка в rAssetsKsu
				declare @name nvarchar(255) = 0;
				declare @inventoryNum nvarchar(32) = null;
				declare @serialNum nvarchar(32) = null;
				declare @orgOwner nvarchar(255) = null;
				declare @orgUser int = null;
				declare @count int = 1;
				declare @category int = 1;
				declare @gorod nvarchar(255) = null;
				declare @address nvarchar(255) = null;
				declare @user nvarchar(255) = null;
				declare @comment nvarchar(255) = null;
				declare @guid as UNIQUEIDENTIFIER;
				declare @date as datetime;
				declare @idksu as int;

				Select 
					@name = a.AssetName,
					@inventoryNum = ac.Custom7,
					@serialNum = ac.Serialnumber,
					@orgOwner = ac.Custom6,
					@gorod = ac.Custom2,
					@address = ac.Custom3,
					@orgUser = c.Id
				from tblAssets as a
				inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
				inner join rCompany$ as c on ac.Custom1 = c.Code
				Where a.AssetID = @AssetId

				Select @guid = NEWID(), @date = GETDATE();

				-- проверка необходимых аргументов
				IF @name is null or @inventoryNum is null or @orgOwner is null or @orgUser is null 
					begin
						raiserror( N'Не определен один из аргументов: название, инвент №, организация владелец, организация пользователь', 12, 1);
						return 1;
					end 

					-- код организации владельца, название, инвентарный номер - должны быть уникальны
					IF EXISTS (
							Select *
							from rAssetsKsu as a
							where a.organization like @orgOwner and a.serialNumber like @serialNum and a.inventoryNumber like @inventoryNum
						)
						begin 
							raiserror( N'В rAssetsKSU уже существует ассет: @orgOwner = %s, @name = %s, @inventNum = %s', 12, 2, @orgOwner, @name, @inventoryNum);
							return 1;
						end

					Select @comment = N'Asset назначен: ' + CONVERT(nvarchar(40), @dateCreate) + N' ' + @userCreate

					INSERT INTO rAssetsKSU (
						[name],
						[code],
						[inventoryNumber],
						[serialNumber],
						[organization],
						[companyId],
						[count],
						[categoryId],
						[room],
						[user],
						[withCategory],
						[registrationDate],
						[guid],
						[Comment] )
					VALUES (
						@name,
						@inventoryNum,
						@inventoryNum,
						@serialNum,
						@orgOwner,
						@orgUser,
						@count,
						@category,
						@gorod + N', ' + @address,
						@user,
						1,
						@date,
						@guid,
						@comment
					);

					Select @idksu = @@IDENTITY;

					-- создаем дополнительную запись для учета
					INSERT INTO rAssetsImported (
						[assetKsuId],
						[isLinked],
						[inventoryNumber],
						[serialNumber],
						[assetId]
					)
					VALUES (	
						@idksu,
						1,
						@inventoryNum,
						@serialNum,
						@AssetId
					);

					Select @idAsset = @@IDENTITY;

			END
		
		-- контроль связанности записей в журнале, должна быть определена цепочка событий для 
		-- находим идентификатор записи спецификации для данного асета
		-- проверяем, что запись в журнале с параметрами @idAsset, @idScl2 существует

		-- из ассета получаем текущие склад и запись в журнале 
		set @idScl1 = (select ai.idScl 
							from rAssetsImported as ai 
							where ai.id = @idAsset);
		-- последняя запись в журнале
		set @idJPrev = (select ai.idJournal 
							from rAssetsImported as ai 
							where ai.id = @idAsset);
		--======================================================
		-- RAISERROR (N'@idJPrev %u', 11, 1, @idJPrev);

		IF @idScl1 = @idScl2 
			begin
				RAISERROR (N'Перемещение одного ассета между одним хранилищем %u', 18, 5, @idScl1);
				return 1;
			end

		declare @Statusprev int;

		-- проверка статуса предыдущей записи
		Select @Statusprev = j.idStatus
			from dbo.rHJournal as j
			Where j.Id = @idJprev;

		IF ( @Statusprev = 1 ) and not ( @userCreate like N'%savin%' or @userCreate like N'%poneve%' or @userCreate like N'%nikk%' or @userCreate like N'%debug%' )
			begin
				raiserror (N'Предыдущее перемещение не было одобрено! Зарегистрируйте ЛК у Савина/Поневежского или произведите отмену.', 18, 5);
				return 1;
			end

		-- текущий статус хранилищ для фиксирования в журнале
		Select @sclStatus1 = s.idStatus
			from rHSclad as s 
			Where s.id = @idScl1;

		Select @sclStatus2 = s.idStatus
			from rHSclad as s 
			Where s.id = @idScl2;

		-- запись в журнале о перемещении
		IF @idJprev is null
			BEGIN
				INSERT INTO dbo.rHJournal( idAsset, idScl1, idSclStatus1, idScl2, idSclStatus2, idStatus, userCreate, dateCreate)
				VALUES (@idAsset, @idScl1, @sclStatus1,  @idScl2, @sclStatus2, 1,  @userCreate, @dateCreate)
			END
		ELSE
			BEGIN
				INSERT INTO dbo.rHJournal( idAsset, idScl1, idSclStatus1, idScl2, idSclStatus2, idJprev, idStatus, userCreate, dateCreate)
				VALUES (@idAsset, @idScl1, @sclStatus1, @idScl2, @sclStatus2, @idJprev, 1,  @userCreate, @dateCreate)
			END
		Select @idJ = @@IDENTITY

		-- пишем в ассет новый склад и запись в журнале. 
		update dbo.rAssetsImported 
		SET idScl = @idScl2,
			idJournal = @idJ
		Where dbo.rAssetsImported.id = @idAsset

		-- меняем статус у хранилищ, которые участвовали в обмене 
		-- ЛК не одобрена. ЛК одобряется в sp_HApprove
		-- склад источник
			update dbo.rHSclad
			SET idStatus = 3
			Where dbo.rHSclad.Id = @idScl1
		-- склад приемник
			update dbo.rHSclad
			SET idStatus = 3
			Where dbo.rHSclad.Id = @idScl2


		return 0;
	END;
GO
