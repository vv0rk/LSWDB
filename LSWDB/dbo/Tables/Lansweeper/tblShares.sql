CREATE TABLE [dbo].[tblShares] (
    [ShareID]       INT      IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT      NOT NULL,
    [ShareUniqueID] INT      NOT NULL,
    [Lastchanged]   DATETIME CONSTRAINT [DF_tblshares_Lastchaged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblshares] PRIMARY KEY CLUSTERED ([ShareID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblShares_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblShares_tblSharesUni] FOREIGN KEY ([ShareUniqueID]) REFERENCES [dbo].[tblSharesUni] ([ShareUniqueID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblShares_tblAssets]
    ON [dbo].[tblShares]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblShares_tblSharesUni]
    ON [dbo].[tblShares]([ShareUniqueID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

