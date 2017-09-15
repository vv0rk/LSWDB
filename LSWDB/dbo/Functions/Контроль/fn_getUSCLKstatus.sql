CREATE FUNCTION [dbo].[fn_getUSCLKstatus]
(
)
RETURNS @returntable TABLE
(
	Name nvarchar(255),
	ret1 int,
	ret2 int,
	ret3 int,
	ret4 int
)
AS
BEGIN
	INSERT @returntable
		select 
			'Number' as ppp
			, [0] as N'ЛК нет'
			, [1] as N'ЛК выдана'
			, [2] as N'ЛК проверена'
			, [3] as N'ЛК не одобрена'
		from (
			select s.idStatus as idStatus, 
			s.Id
			from rHSclad as s 
			inner join rHScladStatus as ss on s.idStatus = ss.Id
			inner join fn_getEmployeeSplited() as e on s.idResponce = e.id
			where ( e.removed is null or e.removed = 0) and 
			e.org = N'УСЦ' and e.level2 not like N'%обособленное подразделение %' and e.level2 not like N'%Нижегородски%' 
			and e.level2 not like N'%Московское%' and e.level2 not like N'Райс' and e.level2 not like N'%Уголь%'
			and s.idStatus in (0, 1, 2, 3)
		) as p
		pivot (
			count(id) for p.idStatus in ([0], [1], [2], [3])
		) as pvt
	RETURN
END
