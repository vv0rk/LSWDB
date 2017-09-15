-- ИНВЕНТАРИЗАЦИЯ: Assets из БУ отсутствующие в LSW
/*
	в этом отчете должны отсутствовать Assets за которые мы отвечаем
	Устройства Категории 1 - windows, printer, switch, router, ups, apc, monitor - должны присутствовать в Lansweeper
	сумки и другие активы должны 
*/

select 
	k.organization,
	k.name,
	ai.inventoryNumber,
	ai.serialNumber,
	k.mol
	
from dbo.rAssetsImported as ai
inner join dbo.rAssetsKsu as k on ai.assetKsuId = k.id
inner join dbo.rCategory as c on k.categoryId = c.id

Where ai.assetId is null and (k.mol like N'%Поневежск%' or k.mol like N'%Савин%') and c.name like N'Категория 1' and k.name not like N'%anasoni%' 
and k.name not like N'мышь%' and k.name not like N'%Gigaset%' and k.name not like N'%GT-E1200%'


--Select 
--	a.assetid as 'ИД',
--	r.Parent as 'Организация', 
--	ac.custom1 as 'Филиал',
--	ac.custom2 as 'Город',
--	ac.custom3 as 'Адрес',
--	ac.custom4 as 'Офис',
--	t.AssetTypename,
--	a.AssetID,
--	a.AssetName,
--	ac.Custom7 as 'Инвент №',
--	ac.SerialNumber as 'Serial №',
--	ac.custom11 as 'ФИО пользователя',
--	ac.custom19 as 'ФИО ответств. ВТшник'
--from tblAssets as a
--inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
--inner join tsysAssetTypes as t on a.Assettype = t.AssetType
--inner join rCompany$ as r on ac.custom1 = r.Code
--left join rAssetsImported as ai on a.AssetID = ai.assetId
--where ai.id is null and ( r.parent like N'ИЭ' or r.parent like N'УСЦ' )
--order by r.Parent, ac.Custom1, ac.custom2, ac.custom3, ac.custom19