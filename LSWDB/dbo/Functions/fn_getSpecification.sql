
CREATE FUNCTION [dbo].fn_getSpecification
(
	@idScl int
)
RETURNS TABLE 
as return 
(
	select 
		a.id 
		, n.name as N'NomName'
		, k.name 
		, a.inventoryNumber
		, a.serialNumber
		, a.assetId
		, j.userCreate
		, j.dateCreate
		, js.StatusName
	from rHSclad as s
	inner join rAssetsImported as a on s.Id = a.idScl
	left join rAssetsKSU as k on a.assetKsuId = k.id
	left join rNomenclature as n on k.nomenclatureId = n.id
	inner join rHJournal as j on a.idJournal = j.Id
	inner join rHJStatus as js on j.idStatus = js.Id

	Where cast(s.Id as nvarchar(20)) like cast(@idScl as nvarchar(20))
)