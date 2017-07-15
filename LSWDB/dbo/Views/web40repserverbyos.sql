
CREATE VIEW [dbo].[web40repserverbyos]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        RTRIM(LTRIM(COALESCE (dbo.tblOperatingsystem.Caption, '') + ' ' + COALESCE (dbo.tblOperatingsystem.OtherTypeDescription, ''))) AS OS, 
                        dbo.tblOperatingsystem.Lastchanged
FROM          dbo.tblComputersystem INNER JOIN
                        dbo.tblAssets ON dbo.tblComputersystem.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblComputersystem.Domainrole > 1) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName