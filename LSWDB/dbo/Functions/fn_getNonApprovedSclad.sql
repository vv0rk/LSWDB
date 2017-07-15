/*
	возвращает хранилища для которых нет подтверждения.
*/
CREATE FUNCTION [dbo].[fn_getNonApprovedSclad]
()
RETURNS TABLE as return
(

	select 
		s.Id
		, e.title
		, ss.StatusSclad
		, t.TypeSclad
	from rHSclad as s
	inner join rHScladStatus as ss on s.idStatus = ss.Id
	inner join rEmployee as e on s.idResponce = e.id
	inner join rHScladType as t on s.idType = t.Id
	where ss.StatusSclad like N'%не одобрена%' or ss.StatusSclad like N'%выдана%' or ss.StatusSclad like N'%нет%'
)
GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getNonApprovedSclad] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getNonApprovedSclad] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getNonApprovedSclad] TO [IE\UIT_USERS_VR]
    AS [dbo];

