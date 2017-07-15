CREATE TABLE [dbo].[tblSharesHist] (
    [Trackercode]   INT          IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT          NOT NULL,
    [ShareUniqueID] INT          NOT NULL,
    [Lastchanged]   DATETIME     CONSTRAINT [DF_tblShareshist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]        NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_tblShareshist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblShareshist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblSharesHist_tblSharesUni] FOREIGN KEY ([ShareUniqueID]) REFERENCES [dbo].[tblSharesUni] ([ShareUniqueID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblShareshist_tblAssets]
    ON [dbo].[tblSharesHist]([AssetID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSharesHist_tblSharesUni]
    ON [dbo].[tblSharesHist]([ShareUniqueID] ASC) WITH (FILLFACTOR = 90);

