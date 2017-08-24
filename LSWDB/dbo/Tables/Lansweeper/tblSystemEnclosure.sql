CREATE TABLE [dbo].[tblSystemEnclosure] (
    [Win32_SystemEnclosureid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [ChassisTypes]            NUMERIC (18)   NULL,
    [LockPresent]             BIT            NULL,
    [Manufacturer]            NVARCHAR (450) NULL,
    [SecurityStatus]          NUMERIC (18)   NULL,
    [SerialNumber]            NVARCHAR (300) NULL,
    [SMBIOSAssetTag]          NVARCHAR (300) NULL,
    [Version]                 NVARCHAR (300) NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblSystemEnclosure_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblSystemEnclosure] PRIMARY KEY CLUSTERED ([Win32_SystemEnclosureid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSystemEnclosure_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSystemEnclosure_tblAssets]
    ON [dbo].[tblSystemEnclosure]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblSystemEnclosure_SMBIOSAssetTag]
    ON [dbo].[tblSystemEnclosure]([SMBIOSAssetTag] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

