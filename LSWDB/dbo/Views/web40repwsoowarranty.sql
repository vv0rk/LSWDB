
CREATE VIEW [dbo].[web40repwsoowarranty]
AS
SELECT      TOP 1000000 dbo.tblAssetCustom.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tblAssetCustom.Model, 
                        dbo.tblAssetCustom.Serialnumber, dbo.tblAssetCustom.PurchaseDate AS [Purchase Date], dbo.tblAssetCustom.Warrantydate AS [Warranty Expiration],
                         dbo.tsysOS.Image AS icon
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.Warrantydate < GETDATE()) AND (dbo.tblComputersystem.Domainrole < 2) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssetCustom.Warrantydate DESC