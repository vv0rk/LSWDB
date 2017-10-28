use lansweeperdb;

go

declare @idScl int = 50815;
declare @idAsset int = 53;
--exec dbo.sp_HApproveSclad @idScl = @idScl

		select 
			--j.Id
			j.idAsset,
			j.idStatus as s_tgt
		from rHJournal as j
		inner join rHSclad as s2 on j.idScl2 = s2.Id
		left join rHSclad as s1 on j.idScl1 = s1.Id
		Where j.idStatus = 1 and s2.Id = @idScl and (s2.idStatus = 1 or s2.idStatus = 3 or s1.idStatus is null) 

select * 
from rHSclad as s
inner join rHJournal as j on s.Id = j.idScl2
where s.Id = @idScl


select 
	s.Id
	, k.name
	, a.inventoryNumber
	, a.serialNumber
	, a.assetId
	, j.userCreate
	, j.dateCreate
	, js.StatusName

from rHSclad as s
inner join rAssetsImported as a on s.Id = a.idScl
inner join rAssetsKsu as k on a.assetKsuId = k.id
inner join rHJournal as j on a.idJournal = j.Id
inner join rHJStatus as js on j.idStatus = js.Id
where s.Id = @idScl
