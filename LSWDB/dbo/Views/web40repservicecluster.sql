
CREATE VIEW [dbo].[web40repservicecluster]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblServices.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblServices ON dbo.tblAssets.AssetID = dbo.tblServices.AssetID INNER JOIN
                        dbo.tblServicesUni ON dbo.tblServices.ServiceuniqueID = dbo.tblServicesUni.ServiceuniqueID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblServicesUni.Name = N'ClusSvc') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName