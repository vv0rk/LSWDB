CREATE TABLE [dbo].[htblticketasset] (
    [ticketid] INT NOT NULL,
    [assetid]  INT NOT NULL,
    CONSTRAINT [PK_htblticketasset] PRIMARY KEY CLUSTERED ([ticketid] ASC, [assetid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketasset_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblticketasset_tblAssets] FOREIGN KEY ([assetid]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);

