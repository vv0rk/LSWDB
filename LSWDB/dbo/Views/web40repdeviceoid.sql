
CREATE VIEW [dbo].[web40repdeviceoid]
AS
SELECT      TOP 1000000 dbo.tblAssetCustom.SnmpOID, dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tsysAssetTypes.AssetTypename, 
                        dbo.tblAssetCustom.Model, dbo.tblAssetCustom.Manufacturer, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssetCustom.SnmpOID, dbo.tsysAssetTypes.AssetTypeIcon10, dbo.tsysAssetTypes.AssetTypename, dbo.tblAssetCustom.Model, 
                        dbo.tblAssetCustom.Manufacturer
HAVING       (dbo.tblAssetCustom.SnmpOID <> '')
ORDER BY dbo.tblAssetCustom.SnmpOID