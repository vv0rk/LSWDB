
CREATE VIEW [dbo].[web40reptotalbios]
AS
SELECT      TOP 1000000 dbo.tblBIOS.Manufacturer, dbo.tblBIOS.Caption AS Bios, dbo.tblBIOS.SMBIOSBIOSVersion AS Version, COUNT(dbo.tblBIOS.AssetID) 
                        AS Total
FROM          dbo.tblBIOS INNER JOIN
                        dbo.tblAssets ON dbo.tblBIOS.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblBIOS.Caption, dbo.tblBIOS.SMBIOSBIOSVersion, dbo.tblBIOS.Manufacturer
ORDER BY COUNT(dbo.tblBIOS.AssetID) DESC