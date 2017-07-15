CREATE TABLE [dbo].[rMatSvodRes] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]    INT            NOT NULL,
    [ModelSprav] NVARCHAR (255) NULL,
    [ModelAsset] NVARCHAR (255) NULL,
    [PartNumber] NVARCHAR (100) NULL,
    [Resource]   INT            NULL,
    [Januar]     INT            NULL,
    [Februar]    INT            NULL,
    [March]      INT            NULL,
    [April]      INT            NULL,
    [May]        INT            NULL,
    [June]       INT            NULL,
    [July]       INT            NULL,
    [August]     INT            NULL,
    [September]  INT            NULL,
    [October]    INT            NULL,
    [November]   INT            NULL,
    [December]   INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

