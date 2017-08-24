CREATE TABLE [dbo].[tblCDROMDrive] (
    [Win32_CDROMDriveid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]            INT            NOT NULL,
    [Capabilities]       NVARCHAR (100) NULL,
    [Caption]            NVARCHAR (450) NULL,
    [Drive]              NVARCHAR (20)  NULL,
    [Manufacturer]       NVARCHAR (450) NULL,
    [SCSIBus]            NUMERIC (18)   NULL,
    [SCSILogicalUnit]    NUMERIC (18)   NULL,
    [SCSIPort]           NUMERIC (18)   NULL,
    [SCSITargetId]       NUMERIC (18)   NULL,
    [Lastchanged]        DATETIME       CONSTRAINT [DF_tblCDROMDrive_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblCDROMDrive] PRIMARY KEY CLUSTERED ([Win32_CDROMDriveid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblCDROMDrive_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCDROMDrive_tblAssets]
    ON [dbo].[tblCDROMDrive]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

