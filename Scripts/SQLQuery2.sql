use lansweeperdb;

Select 
	c.Parent As [Головная организация],
	ac.Custom1 as [Филиал/отделение],

  l.Comments As N'Производитель',
  l.OS As N'Название ПО',
  os.Caption As N'Название ПО полное',
  0 As N'Кол-во лицензий',
  a.AssetName As N'Имя ПК',
  1 As N'Кол-во установок',
  a.AssetID As 'Id',
  ac.Custom1 As N'Филиал',
  s.Statename As N'Статус ПК',
  ac.Custom11 As N'ФИО Пользователя',
  ac.Custom19 As N'ФИО ответственный ВТшник'
From tblAssets As a
Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType
Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID
Inner Join tblState As s On ac.State = s.State
inner Join rCompany$ As c On ac.Custom1 = c.Code
  Left Join tblOperatingsystem As os On a.AssetID = os.AssetID
  Left Join tblOssubLicenses As sl On os.Caption = sl.OS
  Left Join tblOsLicenses As l On sl.OSLicenseidID = l.OSLicenseidID
  Left Join (Select o1.OSLicenseidID,
    ol1.LicenseOwner,
    ol1.OS
  From tblOsLicenses As ol1
    Inner Join (Select Distinct o.OSLicenseidID
    From tblOssubLicensesOrders As o) As o1 On ol1.OSLicenseidID =
      o1.OSLicenseidID) As slo On sl.OSLicenseidID = slo.OSLicenseidID
Where at.AssetTypename = 'Windows'