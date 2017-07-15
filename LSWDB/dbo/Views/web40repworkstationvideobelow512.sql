
CREATE VIEW [dbo].[web40repworkstationvideobelow512]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblVideoController.Caption, 
                        CEILING(dbo.tblVideoController.AdapterRAM / 1024 / 1024) AS [Ram MB], dbo.tblVideoController.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblVideoController INNER JOIN
                        dbo.tblAssets ON dbo.tblVideoController.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (CEILING(dbo.tblVideoController.AdapterRAM / 1024 / 1024) < 512) AND (dbo.tblComputersystem.Domainrole < 2) AND (dbo.tblAssetCustom.State = 1) 
                        AND (COALESCE (dbo.tblVideoController.AdapterRAM, 0) <> 0)
ORDER BY [Ram MB] DESC, dbo.tblAssets.AssetName