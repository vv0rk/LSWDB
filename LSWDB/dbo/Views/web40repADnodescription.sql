
CREATE VIEW [dbo].[web40repADnodescription]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.IPAddress, 
                        COALESCE (dbo.tblADComputers.Description, N'') AS Description, dbo.tsysOS.Image AS icon, dbo.tblADComputers.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblADComputers ON dbo.tblAssets.AssetID = dbo.tblADComputers.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1) AND (COALESCE (dbo.tblADComputers.Description, N'') = '')
ORDER BY dbo.tblAssets.AssetName