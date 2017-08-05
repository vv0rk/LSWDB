use lansweeperdb

go

--Select * 
--from rEmployee as e
--where e.title = N'Савин Николай Владимирович';


; WITH shtat (title, parent_id, id, level, fio) as (
-- anchor member definition
	select o.title, o.parent_id, o.id, 0 as level, e.title
	from rOU as o
	inner join rEmployee as e on o.id = e.parent_id
	where o.parent_id is not null

	union all
-- recursive member definitio
	select o.title + N' / ' + s.title, o.parent_id, o.id, level + 1, s.fio
	from rOU as o
	inner join shtat as s on o.id = s.parent_id
	)


-- execute recurce
select title, parent_id, id, fio, level
from shtat as e
where e.fio like N'Поневе%' 

--select o.title as t, o.parent_id as ppid, o.id as pid
--from rOU as o
--inner join rEmployee as e on o.id = e.parent_id
--where e.title = N'Савин Николай Владимирович';
