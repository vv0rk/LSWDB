
CREATE VIEW [dbo].[web40repsericenonstandard]
AS
SELECT      TOP 1000000 dbo.tsysOS.Image AS Icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, 
                        dbo.tblServicesUni.Caption, dbo.tblServicesUni.Startname, dbo.tblServices.Lastchanged
FROM          dbo.tblServices INNER JOIN
                        dbo.tblAssets ON dbo.tblServices.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblServicesUni ON dbo.tblServices.ServiceuniqueID = dbo.tblServicesUni.ServiceuniqueID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblServicesUni.Startname <> N'NT AUTHORITY\LocalService') AND (dbo.tblServicesUni.Startname <> N'NT AUTHORITY\NetworkService') AND 
                        (dbo.tblServicesUni.Startname <> N'NT AUTHORITY\Network Service') AND (dbo.tblServicesUni.Startname <> N'LocalSystem') AND 
                        (dbo.tblAssetCustom.State = 1) AND (dbo.tblServicesUni.Startname <> N'NT AUTHORITY\LOCAL SERVICE')
ORDER BY dbo.tblAssets.AssetName