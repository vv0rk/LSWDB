use lansweeperdb

go

;with job (level, title, id, parent_id, name, login, jobtitle, org) as (
	-- закрепленная часть 
	select 	0 as level, o.title, o.id, o.parent_id, e.title, e.login, e.post, c.Parent
	from dbo.rOU as o 
	inner join dbo.rEmployee as e on o.id = e.parent_id
	inner join (
		select c.Parent, c.IdOU
		from dbo.rCompany$ as c
		where c.isOrg = 1
	) as c on e.organization = c.IdOU
	--Where e.title like N'Савин Николай Влади%'
	--Where o.parent_id is null
	union all 
	select level + 1, t.title + N'\' + j.title, t.id, t.parent_id, j.name, j.login, j.jobtitle, j.org
	from job as j
	inner join rOU as t on j.parent_id = t.id
	where j.parent_id is not null
)



select level, s.org, s.title, s.jobtitle, s.id, s.parent_id, s.name, s.login

from job as s
where s.name like N'Савин %' and s.parent_id is null
