
CREATE VIEW [dbo].[web40repComputer6432]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblComputersystem.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                            (SELECT      tblAssets.AssetID, MAX(tblProcessor.Architecture) AS Architecture
                              FROM           tblAssets INNER JOIN
                                                      tblProcessor ON tblAssets.AssetID = tblProcessor.AssetID
                              GROUP BY tblAssets.AssetID) ProcCapacity ON ProcCapacity.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1) AND (ProcCapacity.Architecture = 9) AND (dbo.tblComputersystem.SystemType LIKE 'X86%')
ORDER BY dbo.tblAssets.AssetName