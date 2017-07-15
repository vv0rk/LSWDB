
CREATE VIEW [dbo].[web50repchartsoftpublisher]
AS
SELECT      TOP 1000000 COALESCE (dbo.tblSoftwareUni.SoftwarePublisher, N'') AS Publisher, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tblSoftware ON dbo.tblAssets.AssetID = dbo.tblSoftware.AssetID INNER JOIN
                        dbo.tblSoftwareUni ON dbo.tblSoftware.softID = dbo.tblSoftwareUni.SoftID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY COALESCE (dbo.tblSoftwareUni.SoftwarePublisher, N'')
ORDER BY total DESC