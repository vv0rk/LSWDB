CREATE TABLE [dbo].[tsysASSites] (
    [Servername]  NVARCHAR (60)  NOT NULL,
    [Sitename]    NVARCHAR (300) NOT NULL,
    [NetbiosName] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_tsysASSites] PRIMARY KEY CLUSTERED ([Servername] ASC, [Sitename] ASC, [NetbiosName] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysASSites_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [IX_tsysASSites] UNIQUE NONCLUSTERED ([Servername] ASC, [Sitename] ASC, [NetbiosName] ASC) WITH (FILLFACTOR = 90)
);

