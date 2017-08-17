use lansweeperdb;

insert into dbo.rHSclad (idResponce, idType, idCompany )
select 
	e.id
	, 0
	, c.id
from rEmployee as e 
inner join (
		select * from rCompany$  where rCompany$.isOrg = 1 ) as c on e.organization = c.IdOU
left join rHSclad as s on e.id = s.idResponce

where s.Id is null and e.login is not null and e.removed = 0


--select * 
--from rHSclad as s 
--inner join dbo.rEmployee as e on s.idResponce = e.id
--left join (
--		select * from rCompany$  where rCompany$.isOrg = 1 ) as c on e.organization = c.IdOU
--where c.id is null


