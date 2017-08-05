CREATE FUNCTION [dbo].[fn_getPagesMonth]
(
)
RETURNS @returntable TABLE
(
	Id int,
	AssetId int,
	idMaterialOriginal int,
	Resource int,
	Intence float(4),
	Yan int,
	Feb int,
	Mar int,
	Apr int,
	May int,
	Jun int,
	Jul int,
	Aug int,
	Sep int,
	Okt int,
	Nov int,
	Dec int
)
AS
BEGIN

	INSERT @returntable
	Select 
		s.id,
		s.AssetId,
		s.idMaterialOriginal,
		m.Resource,
		s.Intence,
		s.Januar,
		s.Februar,
		s.March,
		s.April,
		s.May,
		s.June,
		s.July,
		s.August,
		s.September,
		s.October,
		s.November,
		s.December
	From dbo.rMaterialSvod as s		
	left join rMaterialOriginal as m on s.idMaterialOriginal = m.Id

	RETURN
END
