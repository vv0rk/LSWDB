
CREATE VIEW [dbo].[web40repbaseboard]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, dbo.tblBaseBoard.Manufacturer, 
                        dbo.tblBaseBoard.Product, dbo.tblBaseBoard.SerialNumber, dbo.tblBaseBoard.Version, dbo.tblBaseBoard.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblBaseBoard ON dbo.tblAssets.AssetID = dbo.tblBaseBoard.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName