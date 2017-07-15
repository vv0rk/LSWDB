
CREATE VIEW [dbo].[web40repUnauthorizedSoft]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Description, dbo.tblSoftwareUni.softwareName AS Software, 
                        dbo.tblSoftware.softwareVersion AS Version, dbo.tblSoftware.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblSoftware INNER JOIN
                        dbo.tblAssets ON dbo.tblSoftware.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblSoftwareUni ON dbo.tblSoftware.softID = dbo.tblSoftwareUni.SoftID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblSoftwareUni.Approved = 2) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName, dbo.tblSoftwareUni.softwareName