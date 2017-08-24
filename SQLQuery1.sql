use lansweeperdb;

go

select 
	md.Id, 
	m.ShortName,
	md.Model,
	ml.ModelSprav,

from rModelDevice as md
left join rFormatPrinter as f on md.idFormat = f.Id
left join rManufacturer as m on md.IdManufacturer = m.Id
left join rModelLink as ml on md.Model = ml.ModelAsset
left join rModelComplect as mc on md.Id = mc.IdModel
left join rModelComplectStatus as ms on mc.IdStatus = ms.Id
left join rmo
where mc.IdStatus = 1 




