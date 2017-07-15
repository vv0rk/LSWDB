CREATE TABLE [dbo].[tblLinuxEnclosure] (
    [LinuxEnclosureId] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT            NOT NULL,
    [ChassisTypes]     NUMERIC (18)   NULL,
    [LockPresent]      BIT            NULL,
    [Manufacturer]     NVARCHAR (450) NULL,
    [SecurityStatus]   NUMERIC (18)   NULL,
    [SerialNumber]     NVARCHAR (300) NULL,
    [SMBIOSAssetTag]   NVARCHAR (300) NULL,
    [Version]          NVARCHAR (300) NULL,
    [Lastchanged]      DATETIME       CONSTRAINT [DF_tblLinuxEnclosure_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxEnclosure] PRIMARY KEY CLUSTERED ([LinuxEnclosureId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxEnclosure_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblLinuxEnclosure_tblAssets]
    ON [dbo].[tblLinuxEnclosure]([AssetID] ASC) WITH (FILLFACTOR = 90);

