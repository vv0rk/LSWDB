CREATE TABLE [dbo].[rShtatR] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Company]     NVARCHAR (255) NOT NULL,
    [Filial]      NVARCHAR (255) NULL,
    [Departament] NVARCHAR (255) NULL,
    [Upravlenie]  NVARCHAR (255) NULL,
    [Grupa]       NVARCHAR (255) NULL,
    [Otdel]       NVARCHAR (255) NULL,
    [Dolgnost]    NVARCHAR (255) NOT NULL,
    [idrPersonal] INT            NULL,
    [idOld]       INT            NULL,
    [Comment]     NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,01/11/2016,>
-- Description:	<Когда добавляем Id пользователя в штатное расписание, добавляем Id штатного расписания в rPersonalNew>
-- =============================================
CREATE TRIGGER Trigger_rPersonalNew_Update1
on [dbo].[rShtatR] FOR UPDATE
AS
IF EXISTS ( SELECT *
			FROM dbo.rShtatR as R
			inner join inserted as i on i.idrPersonal = r.idrPersonal
			where r.id != i.id
			)
	BEGIN
		RAISERROR (N'Сотрудник не может занимать две и более должности одновременно',10,1)
	ROLLBACK TRANSACTION
	END
else 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	with c as (
		select 
			i.id as src_Id,
			p.idrShtatR as tgt_Id
		from inserted as i 
		inner join dbo.rPersonalNew as p on i.idrPersonal = p.Id
		) update c set
		tgt_id = src_Id;

END


GO
GRANT DELETE
    ON OBJECT::[dbo].[rShtatR] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rShtatR] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rShtatR] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rShtatR] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rShtatR] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rShtatR] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rShtatR] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rShtatR] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rShtatR] TO [IE\UIT_USERS_VR]
    AS [dbo];

