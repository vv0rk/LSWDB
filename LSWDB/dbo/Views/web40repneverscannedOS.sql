
CREATE VIEW [dbo].[web40repneverscannedOS]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Firstseen AS [First seen], 
                        CAST(dbo.tblAssets.Lastseen - dbo.tblAssets.Firstseen AS bigint) AS [Days alive]
FROM          dbo.tblAssets LEFT OUTER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblOperatingsystem.AssetID IS NULL) AND (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype = - 1)
ORDER BY dbo.tblAssets.AssetName, CAST(dbo.tblAssets.Lastseen - dbo.tblAssets.Firstseen AS bigint) DESC