﻿

CREATE VIEW web40repOEMwindows
AS Select Top 1000000 tblAssets.AssetID,
  tblAssets.AssetUnique,
  tblAssets.Domain,
  tsysOS.OSname,
  tblOperatingsystem.SerialNumber,
  tblOperatingsystem.Lastchanged,
  tsysOS.Image As icon
From tblAssets
  Inner Join tblOperatingsystem
    On tblAssets.AssetID = tblOperatingsystem.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where ((tblOperatingsystem.SerialNumber Like '%-OEM-%' Or
  tblOperatingsystem.SerialNumber Like '%OEM') And tblAssetCustom.State =
  1) 
Order By tblAssets.AssetName