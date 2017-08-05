

CREATE procedure [dbo].[r_procPrintedPagesFill] 
as
/* FillrMaterialSvod
	Заполняем таблицу rMaterialSvod 
	формируем для каждого устройства сколько отпечатано страниц в месяц
*/
BEGIN
	

	delete from dbo.rMaterialSvod;

	-- вставка значений AssetId и idMaterialOriginal
	insert into dbo.rMaterialSvod 
	(
		AssetId,
		idModelDevices,
		ModelSprav,
		ModelAsset,
		idMaterialOriginal,
		PartNumber,
		Resource
	)
	select 
		ac.AssetID
		, md.id
		, md.Model
		, ac.Model
		, mo.Id
		, mo.PartNumber
		, mo.Resource
	from rMaterialOriginal as mo
	inner join rModelComplect as mc on mo.Id = mc.IdMaterialOriginal
	inner join rModelComplectStatus as mcs on mc.IdStatus= mcs.Id
	inner join rModelDevice as md on mc.IdModel = md.Id
	inner join rModelLink as ml on md.Model = ml.ModelSprav
	inner join tblAssetCustom as ac on ml.ModelAsset = ac.Model

	where mcs.Status = N'ДА'

	-- добавление принтеров для которых не сделаны комплекты
	insert into dbo.rMaterialSvod 
	(
		AssetId,
		idModelDevices,
		ModelSprav,
		ModelAsset
	)
	select 
		ac.AssetID
		, md.Id
		, md.Model
		, ac.Model
	from tblAssetCustom as ac
	inner join tblAssets as a on ac.AssetID = a.AssetID
	Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType and at.AssetTypename = 'Printer'
	left join rModelLink as ml on ac.Model = ml.ModelAsset
	left join rModelDevice as md on ml.ModelSprav = md.Model
	left join rMaterialSvod as ms on ac.AssetID = ms.AssetId
	Where ms.AssetId is null

	-- добавляем значения по отпечаткам для каждого AssetId

	-- для этого файла надо поставить BUILD NONE иначе ошибка SQL70001
	UPDATE dbo.rMaterialSvod
	SET
		dbo.rMaterialSvod.Januar = p.[1],
		dbo.rMaterialSvod.Februar = p.[2],
		dbo.rMaterialSvod.March = p.[3],
		dbo.rMaterialSvod.April = p.[4],
		dbo.rMaterialSvod.May = p.[5],
		dbo.rMaterialSvod.June = p.[6],
		dbo.rMaterialSvod.July = p.[7],
		dbo.rMaterialSvod.August =  p.[8],
		dbo.rMaterialSvod.September = p.[9],
		dbo.rMaterialSvod.October = p.[10],
		dbo.rMaterialSvod.November = p.[11],
		dbo.rMaterialSvod.December = p.[12]

	FROM dbo.rMaterialSvod as ms
	inner join (
		select 
			AssetId
			, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
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
	) as p on ms.AssetId = p.AssetId
END

