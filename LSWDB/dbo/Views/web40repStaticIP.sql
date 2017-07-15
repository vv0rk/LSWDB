
CREATE VIEW [dbo].[web40repStaticIP]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.Image AS icon, dbo.tblNetwork.IPAddress, 
                        dbo.tblNetwork.IPSubnet, dbo.tblNetwork.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblNetwork ON dbo.tblAssets.AssetID = dbo.tblNetwork.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblNetwork.IPAddress <> '0.0.0.0') AND (dbo.tblNetwork.IPEnabled = 1) AND (dbo.tblNetwork.DHCPenabled = 0) AND 
                        (dbo.tblNetwork.IPAddress <> '') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName