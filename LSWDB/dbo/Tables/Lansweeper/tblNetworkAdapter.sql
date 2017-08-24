CREATE TABLE [dbo].[tblNetworkAdapter] (
    [networkadapterid] BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT            NOT NULL,
    [MACAddress]       VARCHAR (20)   NULL,
    [Manufacturer]     NVARCHAR (300) NULL,
    [Name]             NVARCHAR (300) NULL,
    [NetConnectionID]  NVARCHAR (300) NULL,
    [NetEnabled]       BIT            NULL,
    [Speed]            BIGINT         NULL,
    [Lastchanged]      DATETIME       CONSTRAINT [DF_tblNetworkAdapter_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblNetworkAdapter] PRIMARY KEY CLUSTERED ([networkadapterid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblNetworkAdapter_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblNetworkAdapter]
    ON [dbo].[tblNetworkAdapter]([MACAddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblNetworkAdapter_tblAssets]
    ON [dbo].[tblNetworkAdapter]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

