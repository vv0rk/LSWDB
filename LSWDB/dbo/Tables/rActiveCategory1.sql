CREATE TABLE [dbo].[rActiveCategory1] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [IdPrihodSpec] INT           NOT NULL,
    [AssetId]      INT           NULL,
    [nrSerial]     NVARCHAR (50) NULL,
    [nrInv]        NVARCHAR (50) NULL,
    [nrNom]        NVARCHAR (50) NULL,
    [Number]       INT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rActiveCategory1_rAsset_AssetId_AssetId] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[rAsset] ([AssetId]),
    CONSTRAINT [FK_rActiveCategory1_rPrihodSpec_IdPrihodSpec_Id] FOREIGN KEY ([IdPrihodSpec]) REFERENCES [dbo].[rPrihodSpec] ([Id])
);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,24/02/2017,>
-- Description:	<контролируем удаление, изменение, вставка>
/*
	Проверяем что не такого AssetId не назначено для другого 
*/
-- =============================================
CREATE TRIGGER Trigger_rActiveCategory1_delete
on [dbo].[rActiveCategory1] FOR insert, update
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (
				select *
				from inserted as ii
				inner join dbo.rActiveCategory1 as ac on ii.AssetId = ac.AssetId
				where ii.Id <> ac.Id
			)
		BEGIN
			RAISERROR (N'Такой Ассет уже связан с другим Активом rActiveCategory1 и запрещен для повторного назначения',10,1)
			ROLLBACK TRANSACTION
		END

	IF EXISTS (
				select *
				from inserted as ii
				inner join dbo.rActiveCategory1 as ac on ii.nrSerial = ac.nrSerial
				where ii.Id <> ac.Id and ii.nrSerial is not null
			)
		BEGIN
			RAISERROR (N'Такой Ассет уже связан с другим Активом rActiveCategory1 и запрещен для повторного назначения',10,1)
			ROLLBACK TRANSACTION
		END


END



-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,24/02/2017,>
-- Description:	<контролируем удаление, изменение, вставка>
/*
	если количество по приходу меньше чем суммарное то разрешена вставка
	если количество равно то нельзя никаких действий
	если количество по приходу меньше то разрешено удаление
	UPDATE запрещено, если меняется количество или IdPrihodSpec
*/
-- =============================================
--CREATE TRIGGER Trigger_rActiveCategory1_delete
--on [dbo].[rActiveCategory1] FOR delete
--AS
--BEGIN
--	SET NOCOUNT ON;
--	declare @id_prihod int;
--	select @id_prihod = (select IdPrihodSpec from deleted);
	
--	declare @num_prihod int;
--	select @num_prihod = (select number from dbo.rPrihodSpec where dbo.rPrihodSpec.Id = @id_prihod);

--	declare @nr_after_delete int;
--	select @nr_after_delete = (
--				select sum(number)
--				from dbo.rActiveCategory1 
--				where dbo.rActiveCategory1.IdPrihodSpec = @id_prihod
--				group dbo.rActiveCategory1.IdPrihodSpec
--				);

--	IF @num_prihod >
--END


GO
GRANT DELETE
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rActiveCategory1] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rActiveCategory1] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rActiveCategory1] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rActiveCategory1] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rActiveCategory1] TO [IE\UIT_USERS_VR]
    AS [dbo];

