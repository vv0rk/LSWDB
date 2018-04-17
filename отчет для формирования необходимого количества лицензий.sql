use lansweeperdb;


-- отчет для формирования лицензий по фамильно
Select 
	c.Parent as [Головная организация],
	ac.Custom1 As [Филиал/отделение],
	L.LicenseOwner as [Производитель],
	su.softwareName as [Название ПО],
	1 as [Количество установок],
	slo.Nrlicenses as [Куплено лицензий шт.], -- отработать вариант, когда разными ордерами покупаются одни и теже лицензии они должны суммироваться для одной организации
	N'ДА' as [Коммерческая],
	l.softwareName as [Рекомендуемая номенклатура],
	ac.Custom11 as [ФИО пользователя],
	a.AssetName as [Имя ПК],
	a.AssetID as [AssetID (LSW)],
	ac.Custom19 as [ФИО ответств. инж. ВТ],
	lt.LicenseTypeName as [Тип лицензий],
	L.LicenseTypeComments as [Комментарии к лицензированию],
	L.Priceperlicense as [Цена],
	cast(a.AssetID as nvarchar(100)) + l.softwareName as [Ключ]

from tblAssets as a
inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
inner join tsysAssetTypes as t on a.Assettype = t.AssetType
inner join tblState as st on ac.State = st.State
inner join rCompany$ as c on ac.Custom1 = c.Code
inner join tblSoftware as S on a.AssetID = S.AssetID
inner join tblSoftwareUni as su on s.softID = su.SoftID
inner join tblSublicenses as SL on SU.softwareName = SL.softwareName and s.softwareVersion = sl.softwareVersion
Left Join tblSublicensesOrders As SLO On SL.LicenseidID = SLO.LicenseidID And c.Parent = Cast(SLO.Comments As nvarchar(100))
Left Join tblLicenses As L On SL.LicenseidID = L.LicenseidID
left join tsyslicensetype as lt on l.LicenseType = lt.LicenseType

where t.AssetTypename = 'windows' and st.Statename like '%active%'

union all

Select 
	c.Parent As [Головная организация],
	ac.Custom1 as [Филиал/отделение],
	l.LicenseOwner as [Производитель],
	os.Caption As [Название ПО],
	1 as [Количество установок],
	slo.Nrlicenses as [Куплено лицензий шт.], -- отработать вариант, когда разными ордерами покупаются одни и теже лицензии они должны суммироваться для одной организации
	N'ДА' as [Коммерческая],
	l.OS as [Рекомендуемая номенклатура],
	ac.Custom11 as [ФИО пользователя],
	a.AssetName as [Имя ПК],
	a.AssetID as [AssetID (LSW)],
	ac.Custom19 as [ФИО ответств. инж. ВТ],
	N'На рабочую станцию' as [Тип лицензий],
	N'На рабочую станцию' as [Комментарии к лицензированию],
	L.Priceperlicense as [Цена],
	cast(a.AssetID as nvarchar(100)) + l.OS as [Ключ]
From tblAssets As a
Inner Join tsysAssetTypes As t On a.Assettype = t.AssetType
Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID
Inner Join tblState As st On ac.State = st.State
inner Join rCompany$ As c On ac.Custom1 = c.Code
inner join tblOperatingsystem As os On a.AssetID = os.AssetID
left Join tblOssubLicenses As osl On os.Caption = osl.OS
left join tblOssubLicensesOrders as slo on osl.OSLicenseidID =  slo.OSLicenseidID and cast(slo.Comments as nvarchar(100)) like c.Parent
Left Join tblOsLicenses As l On osl.OSLicenseidID = l.OSLicenseidID

where t.AssetTypename = 'windows' and st.Statename like '%active%'

union all

select
	c.Parent as [Головная организация],
	ac.Custom1 As [Филиал/отделение],
	sl.LicenseOwner as [Производитель],
	sss.Name as [Название ПО],
	a.NrProcessors * p.NumberOfCores as [Количество установок],
	slo.Nrlicenses as [Куплено лицензий шт.], -- отработать вариант, когда разными ордерами покупаются одни и теже лицензии они должны суммироваться для одной организации
	N'ДА' as [Коммерческая],
	sl.Name as [Рекомендуемая номенклатура],
	ac.Custom11 as [ФИО пользователя],
	a.AssetName as [Имя ПК],
	a.AssetID as [AssetID (LSW)],
	ac.Custom19 as [ФИО ответств. инж. ВТ],
	lt.LicenseTypeName as [Тип лицензий],
	sl.LicenseTypeComments as [Комментарии к лицензированию],
	sl.PricePerServer as [Цена],
	cast(a.AssetID as nvarchar(100)) + sl.Name as [Ключ]

From tblAssets As a
Inner Join tsysAssetTypes As t On a.Assettype = t.AssetType
Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID
inner join tblProcessor as p on a.AssetID = p.AssetID
Inner Join tblState As st On ac.State = st.State
inner Join rCompany$ As c On ac.Custom1 = c.Code
inner join tblSqlServers as ss on a.AssetID = ss.AssetID
left join tblSqlSubServers as sss on a.AssetName = sss.AssetName
inner join tblSqlLicenses as sl on sss.LicenseID = sl.LicenseID
left join tblSqlLicensesOrders as slo on sl.LicenseID = slo.LicenseID and c.Parent = cast(slo.Comments as nvarchar(100))
left join tsysSqlLicenseTypes as lt on sl.LicenseType = lt.LicenseType

where t.AssetTypename = 'windows' and st.Statename like '%active%' and lt.LicenseTypeName like 'Core Based'

union all

select
	c.Parent as [Головная организация],
	ac.Custom1 As [Филиал/отделение],
	sl.LicenseOwner as [Производитель],
	sss.Name as [Название ПО],
	1 as [Количество установок],
	slo.Nrlicenses as [Куплено лицензий шт.], -- отработать вариант, когда разными ордерами покупаются одни и теже лицензии они должны суммироваться для одной организации
	N'ДА' as [Коммерческая],
	sl.Name as [Рекомендуемая номенклатура],
	ac.Custom11 as [ФИО пользователя],
	a.AssetName as [Имя ПК],
	a.AssetID as [AssetID (LSW)],
	ac.Custom19 as [ФИО ответств. инж. ВТ],
	lt.LicenseTypeName as [Тип лицензий],
	sl.LicenseTypeComments as [Комментарии к лицензированию],
	sl.PricePerServer as [Цена],
	cast(a.AssetID as nvarchar(100)) + sl.Name as [Ключ]

From tblAssets As a
Inner Join tsysAssetTypes As t On a.Assettype = t.AssetType
Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID
Inner Join tblState As st On ac.State = st.State
inner Join rCompany$ As c On ac.Custom1 = c.Code
inner join tblSqlServers as ss on a.AssetID = ss.AssetID
left join tblSqlSubServers as sss on a.AssetName = sss.AssetName
inner join tblSqlLicenses as sl on sss.LicenseID = sl.LicenseID
left join tblSqlLicensesOrders as slo on sl.LicenseID = slo.LicenseID and c.Parent = cast(slo.Comments as nvarchar(100))
left join tsysSqlLicenseTypes as lt on sl.LicenseType = lt.LicenseType

where t.AssetTypename = 'windows' and st.Statename like '%active%' and lt.LicenseTypeName not like 'Core Based'
