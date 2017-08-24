CREATE TABLE [dbo].[tsysDomainControllers] (
    [DomainControllerID]  INT            IDENTITY (1, 1) NOT NULL,
    [Servername]          NVARCHAR (60)  NOT NULL,
    [DomainNetbios]       NVARCHAR (256) NOT NULL,
    [DomainControllerDns] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK__tsysDomainControllers] PRIMARY KEY CLUSTERED ([DomainControllerID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysDomainControllers_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [IX_tsysDomainControllers] UNIQUE NONCLUSTERED ([Servername] ASC, [DomainNetbios] ASC) WITH (FILLFACTOR = 90)
);

