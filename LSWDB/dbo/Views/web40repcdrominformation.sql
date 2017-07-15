

CREATE VIEW [dbo].[web40repcdrominformation]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblCDROMDrive.Drive, 
                        dbo.tsysOS.Image AS icon, dbo.tblCDROMDrive.Caption, dbo.tblCDROMDrive.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblCDROMDrive ON dbo.tblAssets.AssetID = dbo.tblCDROMDrive.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName