use lansweeperdb;

with a as (
select 
	ac.Department as dtgt
	, e.Departament as dsrc
	, ac.Custom17 as logintgt
	, e.Login as loginsrc
	, ac.Custom18 as shtattgt
	, e.idShtat as shtatsrc
	, ac.contact as contacttgt
	, e.email as contactsrc

from tblAssetCustom as ac
inner join rCompany$ as c on ac.Custom1 = c.Code
inner join fn_getEmployee(default) as e on ac.Custom11 = e.Name and c.Parent = e.Org
) update a set
dtgt = dsrc,
logintgt = loginsrc,
shtattgt = shtatsrc,
contacttgt = contactsrc
;
