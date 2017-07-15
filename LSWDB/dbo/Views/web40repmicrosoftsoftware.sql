
CREATE VIEW [dbo].[web40repmicrosoftsoftware]
AS
SELECT      TOP 1000000 dbo.tblSoftwareUni.softwareName AS Software, dbo.tblSoftware.softwareVersion AS Version, COUNT(dbo.tblSoftware.SoftwareID) 
                        AS Total
FROM          dbo.tblSoftware INNER JOIN
                        dbo.tblAssets ON dbo.tblSoftware.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblSoftwareUni ON dbo.tblSoftware.softID = dbo.tblSoftwareUni.SoftID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblSoftwareUni.SoftwarePublisher LIKE N'%microsoft%') AND (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblSoftwareUni.softwareName, dbo.tblSoftware.softwareVersion
ORDER BY Total DESC, dbo.tblSoftwareUni.softwareName