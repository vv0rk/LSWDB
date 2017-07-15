
CREATE VIEW [dbo].[web40repcompbiosversion]
AS
SELECT      TOP 1000000 tblAssets.AssetID, tblAssets.AssetUnique, dbo.tblassetcustom.Model, dbo.tblBIOS.SMBIOSBIOSVersion AS InstalledBIOS, 
                        MaxBios.LatestRev AS LatestBIOS, dbo.tblBIOS.Lastchanged
FROM          dbo.tblBIOS INNER JOIN
                        dbo.tblassetcustom ON dbo.tblBIOS.AssetID = dbo.tblassetcustom.AssetID INNER JOIN
                            (SELECT      Query.Model, MAX(Query.SMBIOSBIOSVersion) LatestRev, MAX(Query.ReleaseDate) MaxReleaseDate
                              FROM           ((SELECT      tblBIOS.ReleaseDate, tblBIOS.SMBIOSBIOSVersion, tblassetcustom.Model
                                                         FROM          tblassetcustom INNER JOIN
                                                                                 tblAssets ON tblAssets.AssetID = tblassetcustom.AssetID INNER JOIN
                                                                                 tblBIOS ON tblAssets.AssetID = tblBIOS.AssetID)) Query
                              GROUP BY Query.Model) MaxBios ON dbo.tblassetcustom.Model = MaxBios.Model AND 
                        dbo.tblBIOS.ReleaseDate < MaxBios.MaxReleaseDate INNER JOIN
                        tblAssets ON tblAssets.AssetID = dbo.tblBIOS.AssetID AND tblAssets.AssetID = dbo.tblassetcustom.AssetID
WHERE      dbo.tblBIOS.SMBIOSBIOSVersion <> MaxBios.LatestRev
ORDER BY dbo.tblassetcustom.Model, tblAssets.AssetUnique