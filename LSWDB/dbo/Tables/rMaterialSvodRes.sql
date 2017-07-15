CREATE TABLE [dbo].[rMaterialSvodRes] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]     INT            NOT NULL,
    [ModelSprav]  NVARCHAR (255) NULL,
    [ModelAsset]  NVARCHAR (255) NULL,
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
    CONSTRAINT [FK_rMaterialSvodRes_rSclad_IdSclad] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialSvodRes] TO [IE\UIT_USERS_VR]
    AS [dbo];

