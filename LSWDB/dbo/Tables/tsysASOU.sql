CREATE TABLE [dbo].[tsysASOU] (
    [OU]         NVARCHAR (380) NOT NULL,
    [Servername] NVARCHAR (60)  NOT NULL,
    CONSTRAINT [PK_tsysASOU] PRIMARY KEY CLUSTERED ([OU] ASC, [Servername] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysASOU_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysASOU_tsysASServers]
    ON [dbo].[tsysASOU]([Servername] ASC) WITH (FILLFACTOR = 90);

