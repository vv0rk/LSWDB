CREATE TABLE [dbo].[rMaterialRashod] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]          INT            NOT NULL,
    [IdMaterialAnalog] INT            NOT NULL,
    [PrintedPages]     INT            NULL,
    [Date]             DATETIME       DEFAULT (getdate()) NULL,
    [Number]           INT            DEFAULT ((1)) NOT NULL,
    [IdSclad]          INT            DEFAULT ((1)) NOT NULL,
    [Id1CSprav]        INT            NULL,
    [Comment]          NVARCHAR (100) NULL,
    [ResourceFact]     INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialAnalog_rMaterailRashod_IdMaterialAnalog] FOREIGN KEY ([IdMaterialAnalog]) REFERENCES [dbo].[rMaterialAnalog] ([Id]),
    CONSTRAINT [FK_rMaterialRashod_r1CSprav_Id1CSprav] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rMaterialRashod_AssetID_PrintedPages]
    ON [dbo].[rMaterialRashod]([AssetId] ASC, [PrintedPages] ASC) WITH (FILLFACTOR = 90);


GO

CREATE trigger [dbo].[trigger_rMaterialRashodAll]
on [dbo].[rMaterialRashod] after insert, update, delete
as
begin
	-- set nocount on added to prevent extra result sets from
	-- interfering with select statements.
	set nocount on;

	with C as (
	select 
		mr.ResourceFact as ResourceFact_tgt
		, p.ResourceFact as ResourceFact_src
		, p.TonerNumber
	from dbo.rMaterialRashod as mr
	inner join (
		select 
			ROW_NUMBER() over( partition by mr.AssetId order by mr.Date) as Number
			, mr.Id as Id
			, mr.AssetId as AssetId
			, ac.Model as 'ModelLS'
			, md.Model as 'ModelSprav'
			, mr.Date
			, ma.PartNumber
			, ma.Resource
			, mr.PrintedPages as res
			, lead(mr.PrintedPages) over( partition by mr.AssetId order by mr.Date) as prev
			, mr.Number as 'TonerNumber'
			, lead(mr.PrintedPages) over( partition by mr.AssetId order by mr.Date) - mr.PrintedPages as ResourceFact
		from dbo.rMaterialRashod as mr
		left join dbo.tblAssetCustom as ac on mr.AssetId = ac.AssetID
		left join dbo.rModelLink as ml on ac.Model = ml.ModelAsset
		left join dbo.rModelDevice as md on ml.ModelSprav = md.Model
		inner join dbo.rMaterialAnalog as ma on mr.IdMaterialAnalog = ma.Id
	) as p on mr.Id = p.Id
) update C set
	ResourceFact_tgt = ResourceFact_src;

end
GO

CREATE trigger [dbo].[trigger_rmaterialrashod_insert]
on [dbo].[rMaterialRashod] for insert
AS
BEGIN
	-- set nocount on added to prevent extra result sets from
	-- interfering with select statements.
	SET NOCOUNT ON;

	Declare @Msg varchar(8000)
	set @Msg = N'Ошибка при назначении материала на устройство. Проверить комплект'

	-- проверяем правильность назначения материала на устройство
		if not exists (select 
			mr.Id
		from inserted as mr
		inner join [dbo].rMaterialLink as ml on mr.IdMaterialAnalog = ml.IdAnalog
		inner join [dbo].rModelComplect as mc on ml.IdOriginal = mc.IdMaterialOriginal
		inner join [dbo].rModelDevice as md on mc.IdModel = md.Id
		inner join [dbo].rModelLink as mol on md.Model = mol.ModelSprav
		inner join [dbo].tblAssetCustom as ac on mr.AssetId = ac.AssetID

		where mol.ModelAsset = ac.Model
		)
		BEGIN
			raiserror(50005,10,1,@Msg)
			ROLLBACK TRANSACTION
		END

	insert into 
		[dbo].rsetrmhist
		(
			assetid,
			custom1,
			custom2,
			custom3,
			custom4,
			custom5,
			[date],
			idmaterialanalog,
			IdMaterialRashod,
			printedpages
		)
		select
			i.assetid,
			ac.custom1,
			ac.custom2,
			ac.custom3,
			ac.custom4,
			ac.custom5,
			i.date,
			i.idmaterialanalog,
			i.Id,
			i.PrintedPages
		from inserted as i
		inner join dbo.tblassetcustom as ac on i.assetid = ac.assetid

	insert into 
		[dbo].rprinthist
		(
			assetid,
			company,
			city,
			[address],
			officenr,
			placenr,
			datecheck,
			printedpages
		)
		select
			i.assetid,
			ac.custom1,
			ac.custom2,
			ac.custom3,
			ac.custom4,
			ac.custom5,
			i.date,
			i.printedpages
		from inserted as i
		inner join dbo.tblassetcustom as ac on i.assetid = ac.assetid

END


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];

