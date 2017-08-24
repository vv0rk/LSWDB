CREATE TABLE [dbo].[TsysDonotscan] (
    [Assetname]        NVARCHAR (150) NOT NULL,
    [Comment]          NVARCHAR (150) NULL,
    [ServerName]       NVARCHAR (60)  NULL,
    [AssetExclusionID] INT            IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([AssetExclusionID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TsysDonotscan_tsysASServers] FOREIGN KEY ([ServerName]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_TsysDonotscan_tsysASServers]
    ON [dbo].[TsysDonotscan]([ServerName] ASC) WITH (FILLFACTOR = 90);

