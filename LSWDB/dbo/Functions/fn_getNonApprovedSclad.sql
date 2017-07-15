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