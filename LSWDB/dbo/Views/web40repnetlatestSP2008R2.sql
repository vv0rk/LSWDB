

 
--------------------------------------------
-- OS: Not latest Service Pack Win2008 R2 --
--------------------------------------------
CREATE VIEW web40repnetlatestSP2008R2
AS
SELECT TOP 1000000 
tblassets.AssetID,
  tblassets.AssetUnique,
  tblassets.Domain,
  tsysos.OSname,
  tblassets.Description,
  tblassets.SP AS [current sp],
  tblassets.Lastseen,
  tsysos.Image AS icon
FROM tblassets
  INNER JOIN tblassetcustom ON tblassets.AssetID = tblassetcustom.AssetID
  INNER JOIN tsysos ON tblassets.OScode = tsysos.OScode
  INNER JOIN tblOperatingsystem ON tblassets.AssetID = tblOperatingsystem.AssetID
WHERE tsysos.OSname = 'win 2008 r2'
  AND tblassets.SP <> 1
  AND tblassetcustom.State = 1
  AND tblOperatingsystem.Caption NOT LIKE '%Hyper-V%'