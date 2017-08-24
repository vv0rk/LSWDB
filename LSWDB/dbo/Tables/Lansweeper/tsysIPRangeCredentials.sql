CREATE TABLE [dbo].[tsysIPRangeCredentials] (
    [IPrangeID] INT NOT NULL,
    [CredID]    INT NOT NULL,
    [Priority]  INT NOT NULL,
    CONSTRAINT [PK_tsysIPRangeCredentials] PRIMARY KEY CLUSTERED ([IPrangeID] ASC, [CredID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysIPRangeCredentials_tsysCredentials] FOREIGN KEY ([CredID]) REFERENCES [dbo].[tsysCredentials] ([CredID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tsysIPRangeCredentials_tsysIPScanRanges] FOREIGN KEY ([IPrangeID]) REFERENCES [dbo].[tsysIPScanRanges] ([IprangeID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysIPRangeCredentials_tsysCredentials]
    ON [dbo].[tsysIPRangeCredentials]([CredID] ASC) WITH (FILLFACTOR = 90);

