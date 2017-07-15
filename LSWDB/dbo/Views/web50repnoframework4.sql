
CREATE VIEW [dbo].[web50repnoframework4]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssets.AssetID NOT IN
                            (SELECT      dbo.tblsoftware.AssetID
                              FROM           dbo.tblSoftware INNER JOIN
                                                      tblsoftwareuni ON tblsoftwareuni.SoftID = dbo.tblSoftware.softID
                              WHERE       dbo.tblsoftwareuni.softwareName LIKE 'Microsoft .NET Framework 2%')) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName