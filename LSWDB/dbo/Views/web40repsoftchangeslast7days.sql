


CREATE VIEW [web40repsoftchangeslast7days]
AS
SELECT        TOP 1000000 
                         tsysOS.Image As Icon, tblAssets.AssetID,
  tblAssets.AssetName,
  CASE tblSoftwareHist.Action WHEN '1' THEN '+' WHEN '2' THEN '-' END AS [+/-], tblSoftwareUni.softwareName AS Software, 
                         tblSoftwareHist.softwareVersion AS Version, tblSoftwareUni.SoftwarePublisher AS Publisher, tblSoftwareHist.Installdate, 
                         tblSoftwareHist.Lastchanged,  tblAssets.Domain,  tblAssets.Username,  tblAssets.Userdomain,  tblAssets.IPAddress,
  tblAssets.Description,  tblAssetCustom.Manufacturer,  tblAssetCustom.Model,  tblAssetCustom.Location,  tsysIPLocations.IPLocation,  tsysOS.OSname As OS,
  tblAssets.SP As SP,  tblAssets.Firstseen,  tblAssets.Lastseen
FROM            tblAssets INNER JOIN
                         tblSoftwareHist ON tblAssets.AssetID = tblSoftwareHist.AssetID INNER JOIN
                         tblSoftwareUni ON tblSoftwareHist.softid = tblSoftwareUni.SoftID INNER JOIN
                         tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN
                         tsysOS ON tblAssets.OScode = tsysOS.OScode
						 LEFT JOIN tsysIPLocations ON tsysIPLocations.StartIP <= tblAssets.IPNumeric AND tsysIPLocations.EndIP >= tblAssets.IPNumeric
WHERE        (tblSoftwareHist.Lastchanged > GETDATE() - 7) AND (tblAssetCustom.State = 1)
ORDER BY tblAssets.AssetName, tblSoftwareHist.Lastchanged DESC, Software