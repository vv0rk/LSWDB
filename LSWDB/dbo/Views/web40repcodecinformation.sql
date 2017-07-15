
CREATE VIEW [dbo].[web40repcodecinformation]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, dbo.tblCodecFile.FileName, 
                        dbo.tblCodecFile.Description, dbo.tblCodecFile.[Group], dbo.tblCodecFile.Manufacturer, dbo.tblCodecFile.Version, dbo.tblCodecFile.lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblCodecFile ON dbo.tblAssets.AssetID = dbo.tblCodecFile.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName