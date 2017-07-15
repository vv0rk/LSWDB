
CREATE VIEW [dbo].[web40repduplicateMAC]
AS
SELECT DISTINCT 
                        TOP 1000000 tblAssets.AssetID, tblAssets.AssetUnique, tblAssets.Domain, tsysOS.OSname AS OS, Duplicates.MACaddress, tblNetwork.Description, 
                        tblNetwork.ServiceName, tblNetwork.IPAddress, Duplicates.Total, tblAssets.Lastseen, tsysOS.Image AS icon
FROM          tblAssets INNER JOIN
                        tblNetwork ON tblAssets.AssetID = tblNetwork.AssetID INNER JOIN
                            (SELECT      tblNetwork_1.MACaddress, COUNT(DISTINCT tblNetwork_1.AssetID) AS Total
                              FROM           tblAssets AS tblAssets_1 INNER JOIN
                                                      tblNetwork AS tblNetwork_1 ON tblAssets_1.AssetID = tblNetwork_1.AssetID INNER JOIN
                                                      tblAssetCustom ON tblAssets_1.AssetID = tblAssetCustom.AssetID
                              WHERE       (tblNetwork_1.IPEnabled = 1) AND (tblAssetCustom.State = 1)
                              GROUP BY tblNetwork_1.MACaddress
                              HAVING        (tblNetwork_1.MACaddress <> '') AND (tblNetwork_1.MACaddress <> '50:50:54:50:30:30') AND 
                                                      (tblNetwork_1.MACaddress <> '33:50:6F:45:30:30') AND (COUNT(DISTINCT tblNetwork_1.AssetID) > 1)) AS Duplicates ON 
                        tblNetwork.MACaddress = Duplicates.MACaddress INNER JOIN
                        tsysOS ON tblAssets.OScode = tsysOS.OScode INNER JOIN
                        tblAssetCustom AS tblAssetCustom_1 ON tblAssets.AssetID = tblAssetCustom_1.AssetID
WHERE      (tblAssetCustom_1.State = 1)
ORDER BY Duplicates.Total DESC, Duplicates.MACaddress