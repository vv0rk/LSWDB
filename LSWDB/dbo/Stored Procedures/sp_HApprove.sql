
CREATE PROCEDURE [dbo].sp_HApprove
	@idAsset int = NULL
AS
	declare @idJ int;
	declare @Status int;
	Declare @userApprove nvarchar(255);
	Declare @dateApprove Datetime;

	SELECT @userApprove = SYSTEM_USER, @dateApprove = GETDATE()

	Select @idJ = ai.idJournal
		from dbo.rAssetsImported as ai
		where ai.id = @idAsset;

	Select @Status = j.idStatus
		from dbo.rHJournal as j 
		where j.Id = @idJ;


	if @Status = 1
		begin
			Update dbo.rHJournal 
			Set idStatus = 2,
			userApprove = @userApprove,
			dateApprove = @dateApprove
			Where dbo.rHJournal.Id = @idJ;
			return 0;
		end

	if @Status = 11
		begin
			Update dbo.rHJournal 
			Set idStatus = 12,
			userApprove = @userApprove,
			dateApprove = @dateApprove
			Where dbo.rHJournal.Id = @idJ;
			return 0;
		end		

	Raiserror( N'Для асета %u нечего подтверждать', 13, 1, @idAsset);

RETURN 1



