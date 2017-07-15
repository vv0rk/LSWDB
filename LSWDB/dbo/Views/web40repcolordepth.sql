
CREATE VIEW [dbo].[web40repcolordepth]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblVideoController.CurrentBitsPerPixel AS Color, dbo.tblVideoController.Caption, dbo.tblVideoController.Lastchanged, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblVideoController INNER JOIN
                        dbo.tblAssets ON dbo.tblVideoController.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblVideoController.CurrentBitsPerPixel < 16) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName