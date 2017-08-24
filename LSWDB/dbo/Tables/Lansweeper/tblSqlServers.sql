CREATE TABLE [dbo].[tblSqlServers] (
    [sqlServerId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [dataPath]       NVARCHAR (1024) NULL,
    [fileVersion]    NVARCHAR (100)  NULL,
    [installPath]    NVARCHAR (1024) NULL,
    [isWow64]        INT             NULL,
    [language]       INT             NULL,
    [skuName]        NVARCHAR (255)  NULL,
    [spLevel]        INT             NULL,
    [version]        NVARCHAR (255)  NULL,
    [displayVersion] NVARCHAR (255)  NULL,
    [lastChanged]    DATETIME        CONSTRAINT [DF_tblSqlServers_lastChanged] DEFAULT (getdate()) NULL,
    [AssetID]        INT             NOT NULL,
    [serviceName]    NVARCHAR (255)  NOT NULL,
    CONSTRAINT [PK_tblSqlServers] PRIMARY KEY CLUSTERED ([sqlServerId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSqlServers_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlServers_tblAssets]
    ON [dbo].[tblSqlServers]([AssetID] ASC) WITH (FILLFACTOR = 90);

