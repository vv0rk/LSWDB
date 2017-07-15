CREATE TABLE [dbo].[rMaterialOriginal] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [PartNumber]     NVARCHAR (100) NOT NULL,
    [Name]           NVARCHAR (255) NOT NULL,
    [Resource]       INT            NULL,
    [IdManufacturer] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rManufacturer_rMaterialOriginal_IdManufacturer] FOREIGN KEY ([IdManufacturer]) REFERENCES [dbo].[rManufacturer] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [AK_rMaterialOriginal_PartNumber] UNIQUE NONCLUSTERED ([PartNumber] ASC) WITH (FILLFACTOR = 90)
);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,17/12/2016,>
-- Description:	<Когда добавляем запись в таблицу rMaterialOriginal такая же запись добавляется в таблицу rMaterialAnalog 
--				и создается запись в таблице rMaterialLink>
-- =============================================
CREATE TRIGGER Trigger_rMaterialOriginal_Create
on [dbo].[rMaterialOriginal] FOR INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO 
		[dbo].rMaterialAnalog
		(
			PartNumber,
			Name,
			[Resource],
			IdManufacturer
		)
		Select
			PartNumber,
			Name,
			[Resource],
			IdManufacturer
		From
			INSERTED

	INSERT INTO
		[dbo].rMaterialLink
		(
			IdOriginal,
			IdAnalog
		)
		Select
			i.Id,
			ma.Id
		from inserted as i
		inner join [dbo].rMaterialAnalog as ma on i.PartNumber = ma.PartNumber
			

END


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,17/12/2016,>
-- Description:	<Когда Удаляем запись из таблицы rMaterialOriginal такая же запись удаляется из таблицы rMaterialAnalog 
--				и таблицы rMaterialLink>
-- =============================================
CREATE TRIGGER [dbo].[TRIGGER_rMaterialOriginal_Delete]
on [dbo].[rMaterialOriginal] FOR DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @id int
	declare @partnumber nvarchar(100)

	select @id = (select id from deleted)
	select @partnumber = (select PartNumber from deleted)

	delete from [dbo].rMaterialLink
	where [dbo].rMaterialLink.IdOriginal = @id

	--delete from [dbo].rMaterialAnalog
	--where [dbo].rMaterialAnalog.PartNumber = @partnumber


END


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,17/12/2016,>
-- Description:	<Когда добавляем запись в таблицу rMaterialOriginal такая же запись добавляется в таблицу rMaterialAnalog 
--				и создается запись в таблице rMaterialLink>
-- =============================================
CREATE TRIGGER [dbo].[Trigger_Create]
on [dbo].[rMaterialOriginal] FOR UPDATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	with c as (
		select 
			mo.IdManufacturer as Manuf_src,
			mo.PartNumber as PN_src,
			mo.Name as Name_src,
			mo.Resource as Res_src,

			ma.IdManufacturer as Manuf_tgt,
			ma.PartNumber as PN_tgt,
			ma.Name as Name_tgt,
			ma.Resource as Res_tgt

		from INSERTED as mo
		--inner join dbo.rMaterialLink as ml on mo.Id = ml.IdOriginal
		inner join dbo.rMaterialAnalog as ma on ma.PartNumber = mo.PartNumber
	)
	update c 
	set 
	Manuf_tgt = Manuf_src,
	--PN_tgt = PN_src,
	Name_tgt = Name_src,
	Res_tgt = Res_src;

END


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialOriginal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialOriginal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialOriginal] TO [IE\UIT_USERS_VR]
    AS [dbo];

