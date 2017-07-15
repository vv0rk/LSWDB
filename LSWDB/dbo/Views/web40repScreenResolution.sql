
CREATE VIEW [dbo].[web40repScreenResolution]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblVideoController.Caption AS Videocard, CAST(dbo.tblVideoController.CurrentHorizontalResolution AS bigint) AS Horizontal, 
                        CAST(dbo.tblVideoController.CurrentVerticalResolution AS bigint) AS Vertical, dbo.tblVideoController.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblVideoController INNER JOIN
                        dbo.tblAssets ON dbo.tblVideoController.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (CAST(dbo.tblVideoController.CurrentHorizontalResolution AS bigint) < 1024) AND (CAST(dbo.tblVideoController.CurrentHorizontalResolution AS bigint) 
                        > 0) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName