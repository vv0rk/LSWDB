
CREATE VIEW [dbo].[web40repservicesstoppedPC]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, dbo.tblServicesUni.Caption, 
                        dbo.tblServices.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblServices INNER JOIN
                        dbo.tblAssets ON dbo.tblServices.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                        dbo.tblServicesUni ON dbo.tblServices.ServiceuniqueID = dbo.tblServicesUni.ServiceuniqueID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblComputersystem.Domainrole < 2) AND (dbo.tblServices.StartID = 3) AND (dbo.tblServices.StateID = 1) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName