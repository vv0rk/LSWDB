CREATE TABLE [dbo].[tblSqlDatabases] (
    [sqlDatabaseId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [dataFilesSizeKb]    INT            NULL,
    [logFilesSizeKb]     INT            NULL,
    [logFilesUsedSizeKb] INT            NULL,
    [name]               NVARCHAR (255) NULL,
    [Lastchanged]        DATETIME       CONSTRAINT [DF_tblSqlDatabases_Lastchanged] DEFAULT (getdate()) NULL,
    [sqlServerId]        BIGINT         NOT NULL,
    CONSTRAINT [PK_tblSqlDatabases] PRIMARY KEY CLUSTERED ([sqlDatabaseId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSqlDatabases_tblSqlServers] FOREIGN KEY ([sqlServerId]) REFERENCES [dbo].[tblSqlServers] ([sqlServerId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlDatabases_tblSqlServers]
    ON [dbo].[tblSqlDatabases]([sqlServerId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

