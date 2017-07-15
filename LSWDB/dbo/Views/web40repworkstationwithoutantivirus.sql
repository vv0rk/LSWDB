

CREATE view web40repworkstationwithoutantivirus
AS
SELECT TOP 1000000 tblassets.AssetID,
  tblassets.AssetUnique,
  tblassets.Domain,
  tblassets.Description,
  tblassets.Lastseen,
  tsysos.Image As icon
FROM tblassets
  INNER JOIN tblcomputersystem ON tblassets.AssetID =
    tblcomputersystem.AssetID
  INNER JOIN tblassetcustom ON tblassets.AssetID =
    tblassetcustom.AssetID
  INNER JOIN tsysos ON tblassets.OScode = tsysos.OScode
WHERE tblassets.AssetID NOT IN
 (SELECT tblsoftware.AssetID
  FROM tblsoftware INNER JOIN tblsoftwareuni On tblsoftwareuni.SoftID =
      tblsoftware.softID INNER JOIN tsysantivirus
      ON tblsoftwareuni.softwareName LIKE tsysantivirus.Software
  ) AND
    tblassets.AssetID NOT IN (SELECT AssetID FROM tblAntivirus)  AND
  tblcomputersystem.Domainrole <=1 AND tblassetcustom.State = 1