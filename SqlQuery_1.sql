use lansweeperdb;

go


with c as (
select 
	n.YanF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 1

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.FebF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 2

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.MarF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 3

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.AprF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 4

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.MayF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 5

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.JunF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 6

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.JulF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 7

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.AugF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 8

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.SepF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 9

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;



with c as (
select 
	n.OktF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 10

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.NovF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 11

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


with c as (
select 
	n.DecF as tgt,
	p.fact as src
from rPrinterMaterialNorm as n
inner join (
		select 
			n.AssetId,
			n.idMaterialOriginal,
			Count(mr.AssetId) as fact

		from rPrinterMaterialNorm as n
		inner join rMaterialLink as ml on n.idMaterialOriginal = ml.IdOriginal
		inner join rMaterialAnalog as ma on ml.IdAnalog = ma.Id
		inner join rMaterialRashod as mr on n.AssetId = mr.AssetId and ml.IdAnalog = mr.IdMaterialAnalog
		where month(mr.Date) = 12

		group by n.AssetId, n.idMaterialOriginal
) as p on n.AssetId = p.AssetId and n.idMaterialOriginal = p.idMaterialOriginal
) update c set
tgt = src;


