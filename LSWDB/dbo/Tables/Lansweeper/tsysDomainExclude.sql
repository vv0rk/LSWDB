CREATE TABLE [dbo].[tsysDomainExclude] (
    [DomainExcludeID] INT            IDENTITY (1, 1) NOT NULL,
    [DomainName]      NVARCHAR (200) NOT NULL,
    [ServerName]      NVARCHAR (60)  NOT NULL,
    [Comment]         NVARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([DomainExcludeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysDomainExclude_tsysASServers] FOREIGN KEY ([ServerName]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysDomainExclude_tsysASServers]
    ON [dbo].[tsysDomainExclude]([ServerName] ASC) WITH (FILLFACTOR = 90);

