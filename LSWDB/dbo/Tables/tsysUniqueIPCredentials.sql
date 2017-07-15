CREATE TABLE [dbo].[tsysUniqueIPCredentials] (
    [IPAddress] VARCHAR (15) NOT NULL,
    [CredID]    INT          NOT NULL,
    [Priority]  INT          NOT NULL,
    CONSTRAINT [PK_tsysUniqueIPCredentials] PRIMARY KEY CLUSTERED ([IPAddress] ASC, [CredID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysUniqueIPCredentials_tsysCredentials] FOREIGN KEY ([CredID]) REFERENCES [dbo].[tsysCredentials] ([CredID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysUniqueIPCredentials_tsysCredentials]
    ON [dbo].[tsysUniqueIPCredentials]([CredID] ASC) WITH (FILLFACTOR = 90);

