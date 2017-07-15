
CREATE VIEW [dbo].[web40repUsedSoftware]
AS
SELECT      TOP 1000000 dbo.tblSoftwareUni.softwareName, dbo.tblSoftware.softwareVersion, dbo.tblSoftwareUni.SoftwarePublisher, 
                        COUNT(dbo.tblSoftwareUni.softwareName) AS [number in use]
FROM          dbo.tblSoftware INNER JOIN
                        dbo.tblAssets ON dbo.tblSoftware.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblSoftwareUni ON dbo.tblSoftware.softID = dbo.tblSoftwareUni.SoftID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblSoftware.softwareVersion, dbo.tblSoftwareUni.softwareName, dbo.tblSoftwareUni.SoftwarePublisher
ORDER BY dbo.tblSoftwareUni.softwareName