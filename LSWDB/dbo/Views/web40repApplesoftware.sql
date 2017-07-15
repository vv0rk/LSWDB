
CREATE VIEW [dbo].[web40repApplesoftware]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblSoftwareUni.softwareName, dbo.tblSoftwareUni.SoftwarePublisher
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblSoftware ON dbo.tblAssets.AssetID = dbo.tblSoftware.AssetID INNER JOIN
                        dbo.tblSoftwareUni ON dbo.tblSoftware.softID = dbo.tblSoftwareUni.SoftID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblSoftwareUni.SoftwarePublisher = N'Apple Inc.') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName