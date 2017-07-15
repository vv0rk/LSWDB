
CREATE VIEW [dbo].[web40repworkstationmultcpu]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetUnique, dbo.tblAssets.AssetID, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        dbo.tblAssets.Processor, dbo.tblAssets.NrProcessors AS [#CPU]
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblComputersystem.Domainrole < 2) AND (dbo.tblAssets.NrProcessors > 1) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.NrProcessors DESC, dbo.tblAssets.AssetName