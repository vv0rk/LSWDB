CREATE FUNCTION [dbo].[fn_getSpecificationForLKext]
(
	
)
RETURNS @returntable TABLE
(
	[id]	INT not null,
	[name]	NVARCHAR (255) not null,
    [inventoryNumber] NVARCHAR (32) NULL,
    [serialNumber]    NVARCHAR (32) NULL,
	[assetId]	INT	NULL,
	[idSclad]	INT NOT NULL,
	[Status]	NVARCHAR(50) NULL
)
AS
BEGIN
	INSERT @returntable
		SELECT 
			ai.id, 
			ak.name, 
			ai.inventoryNumber, 
			ai.serialNumber, 
			ai.assetId, 
			ai.idScl,
			N'' as Status
		FROM rAssetsImported as ai
		INNER JOIN rAssetsKsu as ak ON ai.assetKsuId = ak.id
		inner join fn_getLastHJournalRecords() as l on ai.idScl = l.idScl2 and ai.idJournal = l.Id
		Where l.idStatus = 2

		union all

		SELECT 
			ai.id, 
			ak.name, 
			ai.inventoryNumber, 
			ai.serialNumber, 
			ai.assetId, 
			s.id,
			N'СДАНО' as Status
		from rHSclad as s
		inner join fn_getLastHJournalRecords() as l on s.id = l.idScl1
		inner join rAssetsImported as ai on l.id = ai.idJournal
		INNER JOIN rAssetsKsu as ak ON ai.assetKsuId = ak.id
		Where l.idStatus <> 2 

		UNION ALL 
		 
		SELECT 
			ai.id, 
			ak.name, 
			ai.inventoryNumber, 
			ai.serialNumber, 
			ai.assetId, 
			ai.idScl,
			N'ПРИНЯТО' as Status
		FROM rAssetsImported as ai
		INNER JOIN rAssetsKsu as ak ON ai.assetKsuId = ak.id
		inner join fn_getLastHJournalRecords() as l on ai.idScl = l.idScl2 and ai.idJournal = l.Id
		Where l.idStatus <> 2
	RETURN
END