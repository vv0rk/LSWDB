
CREATE FUNCTION [dbo].fn_getScladAll()
RETURNS  TABLE
as return 
(
select 
	s.id
	, t.TypeSclad
	, e.title
	, e.post
	, hs.StatusSclad
	, s.Gorod
	, s.Adress
	, s.Office
	, c.Code
	, c.titleNaumen
	
from rHSclad as s 
left join rHScladType as t on s.idType = t.Id
left join rHScladStatus as hs on s.idStatus = hs.Id 
left join rEmployee as e on s.idResponce = e.id
left join (select
				c.IdOU
				, c.Code
				, c.titleNaumen
			from rCompany$ as c
			where c.[Филиал] is null
			) as c on e.organization = c.idOU
)