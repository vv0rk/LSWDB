/*
	основываясь на планируемом состоянии КМА и планируемых поставках, 
	формируем в rPlanRMTimeSheet номенклатуру расходных материалов для 
	планирования
*/
CREATE PROCEDURE [dbo].[sp_PlanRMCreateOnDate]
	@tDate datetime = null
AS
	declare @pDate datetime = null;
	declare @ss nvarchar(100) = null;
	declare @m nvarchar(4) = null;
	declare @d nvarchar(4) = '01';

	IF(@tDate is null or @tDate < GETDATE())
		begin
			raiserror(N'Планируемая дата не может быть менее текущей', 1000,1);
			return 1
		end

	IF DATEPART(QUARTER, @tDate) = 1
		begin 
			Set @m = '01'
		end
	IF DATEPART(QUARTER, @tDate) = 2
		begin 
			Set @m = '04'
		end
	IF DATEPART(QUARTER, @tDate) = 3
		begin 
			Set @m = '07'
		end
	IF DATEPART(QUARTER, @tDate) = 4
		begin 
			Set @m = '10'
		end

	Set @ss = YEAR(@tDate) 
	Set @ss = @ss + @m + @d
	Set @pDate = convert(datetime,@ss)

	-- перед формированием удаляем все неподтвержденные данные
	delete from rPlanRMTimeSheet where rPlanRMTimeSheet.Date = @pDate
	-- готовим план по номенклатуре
	insert into rPlanRMTimeSheet (Date, AssetId, idMaterialOriginal, Quantity, isApproved )
	select 
		@pDate,
		p.AssetId,
		rm.idMaterialOriginal,
		-- ставим каждого ресурса = 1 (минимально возможное)
		1,
		-- отмечаем что данные не подтверждены никем из стороннего персонала
		0
	from fn_getPlanStateAssetsOnDate(@pDate) as p
	inner join fn_getComplectsRM() as rm on p.AssetId = rm.AssetId
	inner join rMaterialOriginal as mo on rm.idMaterialOriginal = mo.Id
	inner join tblAssets as a on p.AssetId = a.AssetID
	inner join tsysAssetTypes as t on a.Assettype = t.AssetType
	inner join tblState as s on p.idState = s.State
	Where t.AssetTypename like N'Printer' and (s.Statename like N'Plan' or s.Statename like N'%active%')
RETURN 0
