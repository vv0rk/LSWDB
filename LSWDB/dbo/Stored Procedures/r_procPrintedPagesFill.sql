

CREATE procedure [dbo].[r_procPrintedPagesFill] 
as
/* FillrMaterialSvod
	Заполняем таблицу rMaterialSvod 
	формируем для каждого устройства сколько отпечатано страниц в месяц
*/
	delete from dbo.rMaterialSvod;

	insert into dbo.rMaterialSvod 
	(
		AssetId,
		ModelSprav,
		ModelAsset,
		PartNumber,
		Resource,
		Januar, 
		Februar, 
		March, 
		April, 
		May, 
		June, 
		July, 
		August, 
		September,
		October,
		November,
		December,
		ScladRemain,
		IdSclad
	)
	select 
		a.AssetID
		, mo.ModelSprav
		, ac.Model
		, mo.PartNumber
		, mo.Resourc
		, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
		, smo.Number
		, ss.Id

	from dbo.tblAssets as a 
	inner join dbo.tblAssetCustom as ac on a.assetid = ac.AssetId 
	Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType and at.AssetTypename = 'Printer'
	inner join (
		select 
			AssetId
			, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
		--	, p.PrintedPages
		from (
			select 
				a.AssetID as AssetId
				--, m.mYear as mYear
				, m.mMonth as mmonth
				, max(m.PrintedPages) as PrintedPages

			from dbo.tblAssets as a 
			inner join dbo.tblAssetCustom as ac on a.assetid = ac.AssetId 
			Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType and at.AssetTypename = 'Printer'
			Inner Join tblState As stt On ac.State = stt.State
			inner join (
				select 
					ph.AssetId as AssetId
					, Year(ph.datecheck) as mYear
					, Month(ph.datecheck) as mMonth
					, max(ph.PrintedPages) - min (ph.printedpages) as PrintedPages
				from dbo.rPrintHist as ph
				Group by ph.AssetId, Year(ph.datecheck), Month(ph.datecheck)
			) as m on a.AssetID = m.AssetId
			group by a.AssetID, m.mMonth
		) as p

		pivot
		(
			max(p.PrintedPages)
			for p.mmonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
		) as pvt
		) as pvt on a.AssetID = pvt.AssetId
	left join (
		select 
		mo.PartNumber
		, mo.Id as IdMaterialOriginal
		, mo.Resource as Resourc
		, md.Model as ModelSprav
		, ml.ModelAsset as ModelAsset

		from dbo.rMaterialOriginal as mo
		inner join dbo.rModelComplect as mc on mo.Id = mc.IdMaterialOriginal 
		inner join dbo.rModelComplectStatus as mcs on mcs.Id = mc.IdStatus and mcs.Status = N'ДА'
		inner join dbo.rModelDevice as md on mc.IdModel = md.Id
		inner join dbo.rModelLink as ml on ml.ModelSprav = md.Model
		) as mo on ac.Model = mo.ModelAsset
	left join dbo.rAssetsScladLink as asl on a.AssetId = asl.AssetId
	left join dbo.rSclad as ss on asl.IdSclad = ss.Id
	left join dbo.rScladMaterialOriginal as smo on asl.IdSclad = smo.IdSclad and mo.IdMaterialOriginal = smo.IdMaterialOriginal




