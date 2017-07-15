CREATE TABLE [dbo].[tsysscanqueue] (
    [Scanid]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [Servername] NVARCHAR (60)  NOT NULL,
    [Type]       INT            NOT NULL,
    [Scantarget] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_tsysscanqueue] PRIMARY KEY CLUSTERED ([Scanid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysscanqueue_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysscanqueue_tsysASServers]
    ON [dbo].[tsysscanqueue]([Servername] ASC) WITH (FILLFACTOR = 90);

