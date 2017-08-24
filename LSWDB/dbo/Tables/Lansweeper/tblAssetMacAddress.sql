CREATE TABLE [dbo].[tblAssetMacAddress] (
    [MacID]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT          NOT NULL,
    [Mac]         VARCHAR (20) NOT NULL,
    [LastChanged] DATETIME     CONSTRAINT [DF_tblAssetMacAddress_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblAssetMacAddress] PRIMARY KEY CLUSTERED ([MacID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssetMacAddress_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetMacAddress]
    ON [dbo].[tblAssetMacAddress]([Mac] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAssetMacAddress_tblAssets]
    ON [dbo].[tblAssetMacAddress]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

