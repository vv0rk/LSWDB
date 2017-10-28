use lansweeperdb;

go

Select Top 1000000 ac.AssetID As Id,
  ac.AssetID,
  a.AssetName,
  ac.Custom1 As Организация,
  ac.Custom2 As Город,
  ac.Custom3 As Адрес,
  ac.Custom4 As Офис,
  ac.Custom11 As [ФИО пользователя],
  ac.Custom17 As [Login in Lansweeper],
  ac.Custom19 As [ФИО ВТшника],
  ac.Custom20 As [Обслуживающее подразделение]
From tblAssetCustom As ac
  Inner Join tblAssets As a On ac.AssetID = a.AssetID
  Left Join rEmployee As e On ac.Custom17 = e.login
Where ac.Custom17 Is Not Null And e.login Is Null