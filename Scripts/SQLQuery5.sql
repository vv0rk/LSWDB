use lansweeperdb;


-- отчет для формирования лицензий по фамильно
Select 
	c.Parent as [Головная организация],
	ac.Custom1 As [Филиал/отделение],
	L.LicenseOwner as [Производитель],
	su.softwareName as [Название ПО],
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