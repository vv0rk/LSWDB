use lansweeperdb;

go

Select 
	a.AssetId as 'Id',
	a.AssetId,
	a.AssetName,
	st.Statename, 
  ac.Custom1 As N'Организация',
  ac.Custom2 As N'Город',
  ac.Custom3 As N'Адрес',
  ac.Custom4 As N'Офис',
  ac.Custom9 As N'Модель',
  ac.Custom19 as N'Отв ВТшник',
	p.*
from tblAssets as a 
inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
inner join tsysAssetTypes as t on a.Assettype = t.AssetType
inner join tblState as st on ac.State = st.State
left join (
Select r.AssetId as idAsset,
  r.idMaterialOriginal,
  mo.PartNumber,
  mo.Name As N'Название',
  r.CNT,
  p1.cnt As N'2016 кв. 1',
  p2.cnt As N'2016 кв. 2',
  p3.cnt As N'2016 кв. 3',
  p4.cnt As N'2016 кв. 4',
  p5.cnt As N'2017 кв. 1',
  p6.cnt As N'2017 кв. 2',
  p7.cnt As N'2017 кв. 3',
  p8.cnt As N'2017 кв. 4'
From (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As CNT
  From rMaterialRashod As r
    Inner Join tblAssetCustom As ac On r.AssetId = ac.AssetID
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
	where r.isRemoved = 0 or r.isRemoved is null
  Group By r.AssetId,
    ml.IdOriginal) As r
  Inner Join rMaterialOriginal As mo On r.idMaterialOriginal = mo.Id
  Inner Join tblAssetCustom As ac On r.AssetId = ac.AssetID
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2016 And DatePart(quarter, r.Date) = 1 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p1 On r.AssetId = p1.AssetId And r.idMaterialOriginal =
    p1.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2016 And DatePart(quarter, r.Date) = 2  and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p2 On r.AssetId = p2.AssetId And r.idMaterialOriginal =
    p2.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2016 And DatePart(quarter, r.Date) = 3 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p3 On r.AssetId = p3.AssetId And r.idMaterialOriginal =
    p3.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2016 And DatePart(quarter, r.Date) = 4 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p4 On r.AssetId = p4.AssetId And r.idMaterialOriginal =
    p4.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2017 And DatePart(quarter, r.Date) = 1 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p5 On r.AssetId = p5.AssetId And r.idMaterialOriginal =
    p5.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2017 And DatePart(quarter, r.Date) = 2 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p6 On r.AssetId = p6.AssetId And r.idMaterialOriginal =
    p6.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2017 And DatePart(quarter, r.Date) = 3 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p7 On r.AssetId = p7.AssetId And r.idMaterialOriginal =
    p7.idMaterialOriginal
  Left Join (Select r.AssetId As AssetId,
    ml.IdOriginal As idMaterialOriginal,
    Count(r.Id) As cnt
  From rMaterialRashod As r
    Inner Join rMaterialLink As ml On r.IdMaterialAnalog = ml.IdAnalog
  Where Year(r.Date) = 2017 And DatePart(quarter, r.Date) = 4 and (r.isRemoved = 0 or r.isRemoved is null)
  Group By r.AssetId,
    ml.IdOriginal) As p8 On r.AssetId = p8.AssetId And r.idMaterialOriginal =
    p8.idMaterialOriginal
) as p on a.AssetID = p.idAsset
where t.AssetTypename like N'Printer' and (st.Statename like N'%active%' or st.Statename like N'stock')

Order by ac.custom1, ac.Custom2, ac.Custom3, ac.AssetID, p.idMaterialOriginal