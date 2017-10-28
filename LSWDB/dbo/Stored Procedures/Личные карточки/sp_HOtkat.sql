
/*
	процедура проведения отката последней операции перемещения асетов
	принимает только idAsset
*/

CREATE PROCEDURE [dbo].sp_HOtkat
	@idAsset int = NULL,
	@Comment nvarchar(255) = NULL
AS
	Declare @idJ int;
	Declare @idStatus int;
	Declare @idScl1 int = null;
	declare @sclStatus1 int = null;
	declare @idScl2 int = null;
	declare @sclStatus2 int = null;
	
	Select @idJ = ai.idJournal, @idStatus = j.idStatus, @sclStatus1 = j.idSclStatus1, @sclStatus2 = j.idSclStatus2, @idScl1 = j.idScl1, @idScl2 = j.idScl2
		from dbo.rAssetsImported as ai
		inner join dbo.rHJournal as j on ai.idJournal = j.Id
		where ai.id = @idAsset;

	IF @idStatus = 2 
		BEGIN
			raiserror (N'Последнее перемещение %u было одобрено ИТ активом и должно производится через оформление ЛК', 12, 1, @idJ);
			return 1;
		END

/*	IF @idJ is null 
		begin 
			raiserror (N'Это первая запись, когда асет %u появился в системе', 12, 1, @idAsset);
			return 1;
		end */

	declare @idJprev int;
	declare @idScl int;

	Select @idScl = h.idScl1, @idJprev = h.idJprev
		from dbo.rHJournal as h
		Where h.id = @idJ;

	--RAISERROR (N'idJ = %u', 11, 1, @idJ);

	update dbo.rAssetsImported
	Set idScl = @idScl,
	idJournal = @idJprev
	where dbo.rAssetsImported.id = @idAsset;
	
	update dbo.rHJournal
	Set idStatus = 3,
	Comment = @comment
	where dbo.rHJournal.Id = @idJ;

	IF @sclStatus1 is not null
		begin
			update dbo.rHSclad
			Set idStatus = @sclStatus1
			Where dbo.rHSclad.id = @idScl1
		end
	ELSE
		begin
			update dbo.rHSclad
			Set idStatus = 0
			Where dbo.rHSclad.id = @idScl1
		end
	
	IF @sclStatus2 is not null
		begin
			update dbo.rHSclad
			Set idStatus = @sclStatus2
			Where dbo.rHSclad.id = @idScl2
		end
	ELSE
		begin
			update dbo.rHSclad
			Set idStatus = 0
			Where dbo.rHSclad.id = @idScl2
		end


RETURN 0
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_HOtkat] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[sp_HOtkat] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_HOtkat] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[sp_HOtkat] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_HOtkat] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[sp_HOtkat] TO [IE\UIT_USERS_VR]
    AS [dbo];

