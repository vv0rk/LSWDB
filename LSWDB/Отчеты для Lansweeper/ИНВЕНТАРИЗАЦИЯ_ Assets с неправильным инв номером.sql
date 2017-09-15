-- ИНВЕНТАРИЗАЦИЯ: Assets с неправильным инв номером

Select 
	a.assetid as 'ИД',
	r.Parent as 'Организация', 
	ac.custom1 as 'Филиал',
	ac.custom2 as 'Город',
	ac.custom3 as 'Адрес',
	ac.custom4 as 'Офис',
	t.AssetTypename,
	a.AssetID,
	a.AssetName,
	ac.Custom7 as 'Инвент №',
	ac.SerialNumber as 'Serial №',
	ac.custom11 as 'ФИО пользователя',
	ac.custom19 as 'ФИО ответств. ВТшник'
from tblAssets as a
inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
inner join tsysAssetTypes as t on a.Assettype = t.AssetType
inner join rCompany$ as r on ac.custom1 = r.Code
left join rAssetsImported as ai on a.AssetID = ai.assetId
where ai.id is null and ( r.parent like N'ИЭ' or r.parent like N'УСЦ' )
order by r.Parent, ac.Custom1, ac.custom2, ac.custom3, ac.custom19