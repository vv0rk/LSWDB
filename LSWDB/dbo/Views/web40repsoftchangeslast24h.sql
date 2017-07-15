
CREATE VIEW [web40repsoftchangeslast24h] as
Select Top 1000000 tblAssets.AssetID,
  tblAssets.AssetUnique,
  tblAssets.Domain,
  tsysOS.Image As icon,
  Case tblSoftwareHist.Action When '1' Then '+' When '2' Then '-' End As [+/-],
  tblSoftwareUni.softwareName As Software,
  tblSoftwareHist.softwareVersion As Version,
  tblSoftwareUni.SoftwarePublisher As Publisher,
  tblSoftwareHist.Installdate,
  tblSoftwareHist.Lastchanged
From tblAssets
  Inner Join tblSoftwareHist On tblAssets.AssetID = tblSoftwareHist.AssetID
  Inner Join tblSoftwareUni On tblSoftwareHist.softid = tblSoftwareUni.SoftID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where tblSoftwareHist.Lastchanged > GetDate() - 1 And tblAssetCustom.State = 1
Order By tblAssets.AssetName,
  tblSoftwareHist.Lastchanged Desc,
  tblSoftwareUni.softwareName