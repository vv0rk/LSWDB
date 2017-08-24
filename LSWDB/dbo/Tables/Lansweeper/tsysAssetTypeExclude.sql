CREATE TABLE [dbo].[tsysAssetTypeExclude] (
    [AssetTypeExclusionID] INT            IDENTITY (1, 1) NOT NULL,
    [AssetType]            INT            NOT NULL,
    [ServerName]           NVARCHAR (60)  NOT NULL,
    [Comment]              NVARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([AssetTypeExclusionID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysassettypeexclude_tsysASServers] FOREIGN KEY ([ServerName]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tsysAssetTypeExclude_tsysAssetTypes] FOREIGN KEY ([AssetType]) REFERENCES [dbo].[tsysAssetTypes] ([AssetType])
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetTypeExclude_tsysAssetTypes]
    ON [dbo].[tsysAssetTypeExclude]([AssetType] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetTypeExclude_tsysASServers]
    ON [dbo].[tsysAssetTypeExclude]([ServerName] ASC) WITH (FILLFACTOR = 90);

