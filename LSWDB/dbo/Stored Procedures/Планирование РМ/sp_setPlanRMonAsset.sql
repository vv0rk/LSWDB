/*
	Устанавливает плановое количество РМ в существующем плане
	AssetId, idMaterialOriginal, Date (квартал), Quantity, isApproved
	
*/
CREATE PROCEDURE [dbo].[sp_setPlanRMonAsset]
	@AssetId int = NULL,
	@idMaterialOriginal int = null,
	@tDate datetime = null,
	@Quantity int = 1,
	@isApproved bit = 0
AS

	IF @Quantity > 1
		begin
			update dbo.rPlanRMTimeSheet
			Set
				dbo.rPlanRMTimeSheet.Quantity = dbo.fn_getPrognozRMalgoritm(p.AssetId, p.idMaterialOriginal, @tDate)
			from rPlanRMTimeSheet as p
			inner join tblAssets as a on p.AssetId = a.AssetID
			inner join tsysAssetTypes as t on a.Assettype = t.AssetType
			Where t.AssetTypename like N'Printer' and dbo.fn_getDateStandart(p.Date) = @tDate and p.AssetId = @AssetId and p.idMaterialOriginal = @idMaterialOriginal
		end
	ELSE
		begin
			update dbo.rPlanRMTimeSheet
			Set
				dbo.rPlanRMTimeSheet.Quantity = @Quantity
			from rPlanRMTimeSheet as p
			inner join tblAssets as a on p.AssetId = a.AssetID
			inner join tsysAssetTypes as t on a.Assettype = t.AssetType
			Where t.AssetTypename like N'Printer' and dbo.fn_getDateStandart(p.Date) = @tDate and p.AssetId = @AssetId and p.idMaterialOriginal = @idMaterialOriginal
		end

	IF @isApproved = 1
		begin
			update dbo.rPlanRMTimeSheet
			Set
				dbo.rPlanRMTimeSheet.isApproved = 1
			from rPlanRMTimeSheet as p
			inner join tblAssets as a on p.AssetId = a.AssetID
			inner join tsysAssetTypes as t on a.Assettype = t.AssetType
			Where t.AssetTypename like N'Printer' and dbo.fn_getDateStandart(p.Date) = @tDate and p.AssetId = @AssetId and p.idMaterialOriginal = @idMaterialOriginal
		end
RETURN 0
