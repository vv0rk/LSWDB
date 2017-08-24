CREATE TABLE [dbo].[tsysWaitQueue] (
    [Scanid]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [Servername] NVARCHAR (60)  NOT NULL,
    [Status]     INT            NOT NULL,
    [Name]       NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tsysWaitQueue] PRIMARY KEY CLUSTERED ([Scanid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysWaitQueue_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysWaitQueue_tsysASServers]
    ON [dbo].[tsysWaitQueue]([Servername] ASC) WITH (FILLFACTOR = 90);

