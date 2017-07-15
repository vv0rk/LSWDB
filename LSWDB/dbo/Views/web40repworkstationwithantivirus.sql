

CREATE VIEW web40repworkstationwithantivirus AS
Select Top 1000000 unioned.assetid,
  tblAssets.AssetName,
  tsysOS.Image As icon,
  unioned.software,
  unioned.version,
  unioned.Enabled,
  unioned.Uptodate,
  unioned.RetrievedFrom,
  tblAssets.Domain,
  tblAssets.Username,
  tblAssets.Userdomain,
  tblAssets.IPAddress,
  tblAssets.Description,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tblAssetCustom.Location,
  tsysIPLocations.IPLocation,
  tsysOS.OSname As OS,
  tblAssets.SP As SP,
  tblAssets.Firstseen,
  tblAssets.Lastseen
From ((Select a.assetid As assetid,
    a.software As software,
    a.version As version,
    'software comparison' As RetrievedFrom, '' AS Enabled, '' AS Uptodate
  From (Select tblSoftware.AssetID As assetid,
      tblSoftwareUni.softwareName As software,
      tblSoftware.softwareVersion As version
    From tblSoftware
      Inner Join tblSoftwareUni On tblSoftware.softID = tblSoftwareUni.SoftID
      Inner Join tsysantivirus On tblSoftwareUni.softwareName Like
        tsysantivirus.Software) a)
  Union
  (Select tblAntivirus.AssetID As assetid,
    tblAntivirus.DisplayName As software,
    Null As version,
    'WMI' As RetrievedFrom, CASE WHEN tblAntivirus.onAccessScanningEnabled = 1 THEN 'Yes' ELSE 'No' END AS Enabled, 
  CASE WHEN tblAntivirus.productUpToDate = 1 THEN 'Yes' ELSE 'No' END AS Uptodate
  From tblAntivirus)) unioned
  Inner Join tblAssetCustom On unioned.assetid = tblAssetCustom.AssetID
  Inner Join tblAssets On tblAssets.AssetID = unioned.assetid
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
  Inner Join tblComputersystem On tblAssets.AssetID = tblComputersystem.AssetID
  Left Join tsysIPLocations On tblAssets.LocationID = tsysIPLocations.LocationID
Where tblComputersystem.Domainrole <= 1 And tblAssetCustom.State = 1 ORDER BY tblAssets.AssetName