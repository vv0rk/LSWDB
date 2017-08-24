CREATE TABLE [dbo].[tblSerialnumber] (
    [SerialID]    INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Product]     NVARCHAR (400)  NULL,
    [ProductID]   NVARCHAR (100)  NULL,
    [ProductKey]  NVARCHAR (4000) NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblSerialnumbers_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblSerialnumbers] PRIMARY KEY CLUSTERED ([SerialID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSerialnumber_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSerialnumber_7_834310232__K3_K2_9987]
    ON [dbo].[tblSerialnumber]([Product] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSerialnumber_tblAssets]
    ON [dbo].[tblSerialnumber]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

