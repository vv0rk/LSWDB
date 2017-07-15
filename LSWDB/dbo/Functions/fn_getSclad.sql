

CREATE FUNCTION [dbo].fn_getSclad
(
	@idAsset int
)
RETURNS  TABLE
as return 
(
select 
	a.id
	, a.idScl
	, t.TypeSclad
	, e.title
	, e.post
	, hs.StatusSclad
	, s.Gorod
	, s.Adress
	, s.Office
	, c.Code
	, c.titleNaumen
	
from rAssetsImported as a
left join rHSclad as s on a.idScl = s.Id
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
Where cast( a.id as nvarchar(20)) like cast( @idAsset as nvarchar(20))

)
GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSclad] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSclad] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSclad] TO [IE\UIT_USERS_VR]
    AS [dbo];

