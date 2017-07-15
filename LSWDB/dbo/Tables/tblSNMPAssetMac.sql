CREATE TABLE [dbo].[tblSNMPAssetMac] (
    [SNMPMacID]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT          NOT NULL,
    [IfIndex]         INT          NOT NULL,
    [AssetMacAddress] VARCHAR (50) NOT NULL,
    [Lastchanged]     DATETIME     CONSTRAINT [DF_tblSNMPAssetMac_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Online]          BIT          DEFAULT ((1)) NOT NULL,
    [LastSeen]        DATETIME     NOT NULL,
    CONSTRAINT [PK_tblSNMPAssetMac] PRIMARY KEY CLUSTERED ([SNMPMacID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSNMPAssetMac_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSNMPAssetMac]
    ON [dbo].[tblSNMPAssetMac]([AssetID] ASC, [IfIndex] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblSNMPAssetMacAddress]
    ON [dbo].[tblSNMPAssetMac]([AssetMacAddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

