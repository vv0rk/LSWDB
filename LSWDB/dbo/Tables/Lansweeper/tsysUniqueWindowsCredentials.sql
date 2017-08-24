CREATE TABLE [dbo].[tsysUniqueWindowsCredentials] (
    [AssetUnique] NVARCHAR (300) NOT NULL,
    [CredID]      INT            NOT NULL,
    CONSTRAINT [PK_tsysUniqueWindowsCredentials] PRIMARY KEY CLUSTERED ([AssetUnique] ASC, [CredID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysUniqueWindowsCredentials_tsysCredentials] FOREIGN KEY ([CredID]) REFERENCES [dbo].[tsysCredentials] ([CredID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [UQ_tsysUniqueWindowsCredentials] UNIQUE NONCLUSTERED ([AssetUnique] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysUniqueWindowsCredentials_tsysCredentials]
    ON [dbo].[tsysUniqueWindowsCredentials]([CredID] ASC) WITH (FILLFACTOR = 90);

