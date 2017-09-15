﻿/*
	создает точку на временной оси нормой расходного материала
	сама норма находится в состоянии конструирования
*/
CREATE PROCEDURE [dbo].[sp_NormRMCreateOnDate]
	@AssetId int = NULL,
	@idMaterialOriginal int = null,
	@Quantity int = NULL,
	@tDate datetime = null
AS
	declare @ss int = null;
	declare @m nvarchar(10) = null;
	declare @d int =null;
	declare @pDate datetime = null;


	IF(@tDate is null or @tDate < GETDATE())
		begin
			raiserror(N'Норма не может быть на дату менее текущей', 1000,1);
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
	delete from rNormMaterialRashod where rNormMaterialRashod.Date = @pDate
	-- готовим план по номенклатуре
	insert into rNormMaterialRashod (Date, AssetId, idMaterialOriginal, Quantity, isApproved )
	select 
		@pDate,
		p.AssetId,
		rm.idMaterialOriginal,
		-- ставим каждого ресурса = 1 (минимально возможное)
		1,
		-- отмечаем что данные не подтверждены никем из стороннего персонала
		0
	from fn_getNormMaterialRashodOnDate(@pDate) as p
	inner join fn_getComplectsRM() as rm on p.AssetId = rm.AssetId
	inner join rMaterialOriginal as mo on rm.idMaterialOriginal = mo.Id
	inner join tblAssets as a on p.AssetId = a.AssetID
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	inner join tsysAssetTypes as t on a.Assettype = t.AssetType
	inner join tblState as s on ac.State = s.State
	Where t.AssetTypename like N'Printer' and s.Statename like N'%active%'

RETURN 0
