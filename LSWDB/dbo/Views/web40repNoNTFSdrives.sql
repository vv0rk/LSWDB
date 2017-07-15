
CREATE VIEW [dbo].[web40repNoNTFSdrives]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblDiskdrives.Caption AS Drive, dbo.tblDiskdrives.FileSystem, dbo.tblDiskdrives.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblDiskdrives INNER JOIN
                        dbo.tblAssets ON dbo.tblDiskdrives.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblDiskdrives.FileSystem <> 'NTFS') AND (dbo.tblDiskdrives.FileSystem <> '') AND (dbo.tblDiskdrives.DriveType = 3) AND 
                        (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName