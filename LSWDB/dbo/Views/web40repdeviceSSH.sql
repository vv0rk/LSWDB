
CREATE VIEW [dbo].[web40repdeviceSSH]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetName, dbo.tblAssetCustom.SSHServer, dbo.tblAssets.IPAddress, 
                        dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.Lastseen, dbo.tblAssets.Lasttried
FROM          dbo.tblAssets INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssetCustom.SSHServer <> N'')