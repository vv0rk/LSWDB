CREATE TABLE [dbo].[tsysAssetTypes] (
    [AssetType]       INT            NOT NULL,
    [AssetTypename]   NVARCHAR (100) NOT NULL,
    [AssetTypeIcon10] NVARCHAR (250) NULL,
    [AssetTypeIcon16] NVARCHAR (250) NULL,
    [AssetTypeIcon48] NVARCHAR (250) NULL,
    [LastChanged]     DATETIME       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tsysAssetTypes] PRIMARY KEY CLUSTERED ([AssetType] ASC) WITH (FILLFACTOR = 90)
);

