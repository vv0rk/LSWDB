/*
	функция возвращает последние записи журнала
*/
CREATE FUNCTION [dbo].[fn_getLastJournalRecords]
(
)
RETURNS @returntable TABLE
(
    [Id]           INT,
	-- ассет который двигаем.
    [idAsset]      INT,
	-- склад из которого перемещаем ассет
    [idScl1]       INT,
	-- склад на который падает ассет
    [idScl2]       INT,
	-- ссылка не предыдущую запись
    [idJprev]      INT,
    [idStatus]     INT,
    [userCreate]   NVARCHAR (255),
    [dateCreate]   DATETIME,
    [userApprove]  NVARCHAR (255),
    [dateApprove]  DATETIME,
    [Comment]      NVARCHAR (255),
    [idSclStatus1] INT,
    [idSclStatus2] INT
)
AS
BEGIN
	--INSERT @returntable
	RETURN
END
