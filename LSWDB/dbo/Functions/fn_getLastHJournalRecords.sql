/*
	Возвращаю последние записи о перемещении Ассета из журнала
*/
CREATE FUNCTION [dbo].[fn_getLastHJournalRecords]
(
)
RETURNS @returntable TABLE
(
	[Id]           INT            Primary key,
	-- ассет который двигаем.
    [idAsset]      INT            NOT NULL,
	-- склад из которого перемещаем ассет
    [idScl1]       INT            NULL,
	-- склад на который падает ассет
    [idScl2]       INT            NULL,
	-- ссылка не предыдущую запись
    [idJprev]      INT            NULL,
    [idStatus]     INT            NOT NULL,
    [userCreate]   NVARCHAR (255) NULL,
    [dateCreate]   DATETIME       NULL,
    [userApprove]  NVARCHAR (255) NULL,
    [dateApprove]  DATETIME       NULL,
    [Comment]      NVARCHAR (255) NULL,
    [idSclStatus1] INT            NULL,
    [idSclStatus2] INT            NULL,
	-- сохраняем идентификаторы ЛК
	[idLK1]			BIGINT		NULL,
	[idLK2]			BIGINT		NULL
)
AS
BEGIN
	INSERT @returntable
	select 
		j.Id, j.idAsset, j.idScl1, j.idScl2, j.idJprev, j.idStatus, j.userCreate, j.dateCreate,
		j.userApprove, j.dateApprove, j.Comment, j.idSclStatus1, j.idSclStatus2, j.idLK1, j.idLK2
		from (
			select 
			ROW_NUMBER() over (partition by idAsset order by dateCreate desc) as Number,  
			j.*
			from rHJournal as j
		) as j 
		where j.Number = 1
	RETURN
END
