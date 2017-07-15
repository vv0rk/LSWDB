

CREATE view [web40replocaladmin] AS
SELECT TOP 1000000  tsysOS.Image As icon,  tblAssets.AssetID,  tblAssets.AssetName,  tblUsersInGroup.Domainname, 
                    tblUsersInGroup.Username, tblUsersInGroup.Lastchanged, tblAssets.Domain,  tblAssets.IPAddress,
  tblAssets.Description,  tblAssetCustom.Manufacturer,  tblAssetCustom.Model,  tblAssetCustom.Location,  tsysIPLocations.IPLocation,  tsysOS.OSname As OS,
  tblAssets.SP As SP,  tblAssets.Firstseen,  tblAssets.Lastseen
FROM tblUsersInGroup 
  INNER JOIN tblAssets ON tblUsersInGroup.AssetID = tblAssets.AssetID 
  INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID 
  INNER JOIN tsysOS ON tblAssets.OScode = tsysOS.OScode
  Left Join tsysIPLocations On tsysIPLocations.StartIP <= tblAssets.IPNumeric    And tsysIPLocations.EndIP >= tblAssets.IPNumeric
WHERE
  (
    NOT EXISTS ( SELECT tblAssets.AssetName AS Domain, tblUsers.Name AS Username FROM tblAssets 
          INNER JOIN tblUsers ON tblAssets.AssetID = tblUsers.AssetID
        WHERE (tblUsers.BuildInAdmin = 1) AND (tblUsersInGroup.Domainname = tblAssets.AssetName) AND (tblUsersInGroup.Username = tblUsers.Name)
    )
    AND NOT EXISTS( SELECT Domain, AdminName AS username FROM tsysadmins WHERE (tblUsersInGroup.Domainname LIKE Domain) AND (tblUsersInGroup.Username LIKE  AdminName))
  )   AND (tblUsersInGroup.Admingroup = 1)   AND (tblAssetCustom.State = 1)
  ORDER BY tblAssets.AssetName