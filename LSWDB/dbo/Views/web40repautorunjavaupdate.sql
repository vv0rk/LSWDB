
CREATE VIEW [dbo].[web40repautorunjavaupdate]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        dbo.tblAutorunUni.Caption, dbo.tblAutorun.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAutorun ON dbo.tblAssets.AssetID = dbo.tblAutorun.AssetID INNER JOIN
                        dbo.tblAutorunUni ON dbo.tblAutorun.AutorunUNI = dbo.tblAutorunUni.AutorunUNI INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAutorunUni.Command LIKE N'%jusched.exe%')
ORDER BY dbo.tblAssets.AssetName