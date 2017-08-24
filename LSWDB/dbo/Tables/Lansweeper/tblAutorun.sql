CREATE TABLE [dbo].[tblAutorun] (
    [AutorunID]   INT      IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT      NOT NULL,
    [AutorunUNI]  INT      NOT NULL,
    [LocationID]  INT      NOT NULL,
    [Lastchanged] DATETIME CONSTRAINT [DF_tblAutorun_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblAutorun] PRIMARY KEY CLUSTERED ([AutorunID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAutorun_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblAutorun_tblautorunloc] FOREIGN KEY ([LocationID]) REFERENCES [dbo].[tblAutorunLoc] ([LocationID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblAutorun_tblAutorunUni] FOREIGN KEY ([AutorunUNI]) REFERENCES [dbo].[tblAutorunUni] ([AutorunUNI]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAutorun_7_1977266299__K2_8066]
    ON [dbo].[tblAutorun]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAutorun_7_1977266299__K3_K2_9987]
    ON [dbo].[tblAutorun]([AutorunUNI] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAutorun_tblautorunloc]
    ON [dbo].[tblAutorun]([LocationID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

