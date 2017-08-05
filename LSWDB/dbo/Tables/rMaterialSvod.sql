CREATE TABLE [dbo].[rMaterialSvod] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]     INT            NOT NULL,
	[idModelDevices] int NULL,
    [ModelSprav]  NVARCHAR (255) NULL,
    [ModelAsset]  NVARCHAR (255) NULL,
	[idMaterialOriginal] int null,
    [PartNumber]  NVARCHAR (100) NULL,
    [Resource]    INT            NULL,
    [Januar]      INT            NULL,
    [Februar]     INT            NULL,
    [March]       INT            NULL,
    [April]       INT            NULL,
    [May]         INT            NULL,
    [June]        INT            NULL,
    [July]        INT            NULL,
    [August]      INT            NULL,
    [September]   INT            NULL,
    [October]     INT            NULL,
    [November]    INT            NULL,
    [December]    INT            NULL,
    [IdSclad]     INT            NULL,
    [PercentRes]  INT            DEFAULT ((100)) NOT NULL,
    [ScladRemain] INT            NULL,
    [Intence]     REAL           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialSvod_rSclad_IdSclad] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id]), 
    CONSTRAINT [FK_rMaterialSvod_tblAssets] FOREIGN KEY (AssetId) REFERENCES dbo.tblAssets ([AssetId]), 
    CONSTRAINT [FK_rMaterialSvod_rMaterialOriginal] FOREIGN KEY (idMaterialOriginal) REFERENCES dbo.rMaterialOriginal (Id)

);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialSvod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO

CREATE unique nonclustered INDEX [IX_rMaterialSvod_Column] ON [dbo].[rMaterialSvod] (AssetId, idMaterialOriginal);
