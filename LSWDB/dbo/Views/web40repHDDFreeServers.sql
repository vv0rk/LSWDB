


------------------------------------------
-- Disk: Servers less than 1 GB free HD --
------------------------------------------
CREATE VIEW web40repHDDFreeServers
AS
SELECT TOP 1000000
  tblassets.AssetID,
  tblassets.AssetUnique,
  tsysos.OSname,
  tblassets.Description,
  tbldiskdrives.Caption,
  Cast(Cast(tbldiskdrives.Freespace AS bigint) / 1024 / 1024 AS numeric) AS free,
  Cast(Cast(tbldiskdrives.Size AS bigint) / 1024 / 1024 AS numeric) AS [total size],
  tbldiskdrives.Lastchanged AS [last changed],
  tsysos.Image AS icon
FROM tblassets
  INNER JOIN tbldiskdrives ON tblassets.AssetID = tbldiskdrives.AssetID
  INNER JOIN tbloperatingsystem ON tblassets.AssetID = tbloperatingsystem.AssetID
  INNER JOIN tblcomputersystem ON tblassets.AssetID = tblcomputersystem.AssetID
  INNER JOIN tblassetcustom ON tblassets.AssetID = tblassetcustom.AssetID
  INNER JOIN tsysos ON tblassets.OScode = tsysos.OScode
WHERE Cast(Cast(tbldiskdrives.Freespace AS bigint) / 1024 / 1024 AS numeric) < 1024
  AND Cast(Cast(tbldiskdrives.Size AS bigint) / 1024 / 1024 AS numeric) <> 0
  AND tblcomputersystem.Domainrole > 1 And tbldiskdrives.DriveType = 3
  AND tblassetcustom.State = 1