
CREATE VIEW [dbo].[web40repduplicateSID]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname AS OS, dbo.tblAssets.Description, 
                        dbo.tblUsers.SID, Duplicates.Total, dbo.tblAssets.Lastseen, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblUsers ON dbo.tblAssets.AssetID = dbo.tblUsers.AssetID INNER JOIN
                            (SELECT      dbo.tblUsers.SID, COUNT(dbo.tblUsers.UserID) AS Total
                              FROM           dbo.tblAssets INNER JOIN
                                                      dbo.tblUsers ON dbo.tblAssets.AssetID = dbo.tblUsers.AssetID INNER JOIN
                                                      dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
                              WHERE       (dbo.tblAssetCustom.State = 1)
                              GROUP BY dbo.tblUsers.SID
                              HAVING        (dbo.tblUsers.SID LIKE '%-500') AND (COUNT(dbo.tblUsers.UserID) > 1)) Duplicates ON dbo.tblUsers.SID = Duplicates.SID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY Duplicates.Total DESC, dbo.tblUsers.SID, dbo.tblAssets.AssetName