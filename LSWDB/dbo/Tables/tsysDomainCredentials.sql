CREATE TABLE [dbo].[tsysDomainCredentials] (
    [DomainName]  NVARCHAR (150) NOT NULL,
    [CredID]      INT            NOT NULL,
    [Priority]    INT            NULL,
    [IsWorkgroup] BIT            NOT NULL,
    CONSTRAINT [PK_tsysDomainCredentials] PRIMARY KEY CLUSTERED ([DomainName] ASC, [CredID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysDomainCredentials_tsysCredentials] FOREIGN KEY ([CredID]) REFERENCES [dbo].[tsysCredentials] ([CredID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysDomainCredentials_tsysCredentials]
    ON [dbo].[tsysDomainCredentials]([CredID] ASC) WITH (FILLFACTOR = 90);

