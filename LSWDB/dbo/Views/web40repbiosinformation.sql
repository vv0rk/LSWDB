
CREATE VIEW [dbo].[web40repbiosinformation]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.Image AS icon, dbo.tblBIOS.Caption, 
                        dbo.tblBIOS.Manufacturer, dbo.tblBIOS.SerialNumber AS Serial, dbo.tblBIOS.SMBIOSMajorVersion AS [V.Ma], 
                        dbo.tblBIOS.SMBIOSMinorVersion AS [V.Mi], dbo.tblBIOS.Version, dbo.tblBIOS.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblBIOS ON dbo.tblAssets.AssetID = dbo.tblBIOS.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName