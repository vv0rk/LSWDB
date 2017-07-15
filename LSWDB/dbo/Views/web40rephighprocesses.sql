
CREATE VIEW [dbo].[web40rephighprocesses]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        COUNT(dbo.tblProcesses.ProcessID) AS [Total Processes]
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblProcesses ON dbo.tblAssets.AssetID = dbo.tblProcesses.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, dbo.tsysOS.Image
HAVING       (COUNT(dbo.tblProcesses.ProcessID) > 70)
ORDER BY [Total Processes] DESC