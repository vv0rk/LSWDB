CREATE TABLE [dbo].[tsysAssetRelationTypes] (
    [RelationTypeID]     INT            NOT NULL,
    [Name]               NVARCHAR (50)  NULL,
    [Standard]           BIT            NULL,
    [RelationTypeIcon10] NVARCHAR (250) NULL,
    [RelationTypeIcon16] NVARCHAR (250) NULL,
    [RelationTypeIcon48] NVARCHAR (250) NULL,
    [ReverseName]        NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([RelationTypeID] ASC) WITH (FILLFACTOR = 90)
);

