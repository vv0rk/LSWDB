use lansweeperdb

go

Select Top 1000000 a.AssetID,
  t.AssetTypename,
  e.Departament as 'Департамент',
  a.AssetName As N'Тип устройства',
  ac.Custom1 As N'Организация',
  ac.Custom2 As N'Город',
  ac.Custom3 As N'Адрес',
  ac.Custom4 As N'Офис',
  ac.Custom11 As N'ФИО пользователя',
  ac.Custom17 As N'Login пользователя',
  ac.Custom19 As N'ФИО ответственный ВТшник',
  ac.Custom20 As N'Обслуживающее подразделение'
  
  
From tblAssets As a
  Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID
  Inner Join tsysAssetTypes As t On a.Assettype = t.AssetType
  Left Join rCompany$ As c On ac.Custom1 = c.Code
  Left Join fn_getEmployee(DEFAULT) as e on c.Parent = e.Org and ac.Custom11 = e.Name
Where t.AssetTypename Not Like N'ИС' And ac.Custom20 Not Like N'Техноло%' And
  ac.Custom20 Not Like N'%ЗАКАЗЧ%' and ac.Custom20 not like N'ОЭСИ' and ac.Custom20 not like N'РАЗРАБОТКА' 



