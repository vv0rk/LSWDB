
CREATE VIEW [dbo].[web40repwarrantyoverview]
AS
SELECT      TOP 1000000 dbo.tblAssetCustom.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tblAssetCustom.Model, 
                        dbo.tblAssetCustom.Serialnumber AS Serial, dbo.tblAssetCustom.PurchaseDate AS [Purchase Date], 
                        dbo.tblAssetCustom.Warrantydate AS [Warranty Expiration], dbo.tsysOS.Image AS icon
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.PurchaseDate IS NOT NULL) AND (dbo.tblAssetCustom.State = 1) OR
                        (dbo.tblAssetCustom.Warrantydate IS NOT NULL) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssetCustom.Warrantydate DESC