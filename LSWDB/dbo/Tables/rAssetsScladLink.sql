CREATE TABLE [dbo].[rAssetsScladLink] (
    [Id]      INT IDENTITY (1, 1) NOT NULL,
    [AssetID] INT NOT NULL,
    [IdSclad] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rAssetsLink_rAsset_rAssetID] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[rAsset] ([AssetId])
);

