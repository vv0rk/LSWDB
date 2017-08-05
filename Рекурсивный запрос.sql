use lansweeperdb

go

; WITH shtat (title, parent_id, id, level, fio, job, login, email, isRemoved, idOrg ) as (
-- anchor member definition
	select o.title, o.parent_id, o.id, 0 as level, e.title, e.post, e.login, e.email, e.isRemoved, e.organization as idOrg
	from rOU as o
	inner join rEmployee as e on o.id = e.parent_id
	where o.parent_id is not null

	union all
-- recursive member definitio
	select o.title + N' / ' + s.title, o.parent_id, o.id, level + 1, s.fio, s.job, s.login, s.email, s.isRemoved, s.idOrg
	from rOU as o
	inner join shtat as s on o.id = s.parent_id
	)


-- execute recurce
select title, job, fio, login, email, isRemoved, e.id, level, c.Code
from shtat as e
inner join rCompany$ as c on e.idOrg = c.IdOU
where e.fio like N'Причко%' and e.parent_id is null and c.isOrg = 1

