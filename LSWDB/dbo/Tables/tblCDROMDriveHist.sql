CREATE TABLE [dbo].[tblCDROMDriveHist] (
    [Trackercode]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT            NOT NULL,
    [Capabilities]    NVARCHAR (100) NULL,
    [Caption]         NVARCHAR (450) NULL,
    [Drive]           NVARCHAR (20)  NULL,
    [Manufacturer]    NVARCHAR (450) NULL,
    [SCSIBus]         NUMERIC (18)   NULL,
    [SCSILogicalUnit] NUMERIC (18)   NULL,
    [SCSIPort]        NUMERIC (18)   NULL,
    [SCSITargetId]    NUMERIC (18)   NULL,
    [Lastchanged]     DATETIME       CONSTRAINT [DF_tblCDROMDrivehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]          NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblCDROMDrivehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCDROMDrivehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCDROMDrivehist_tblAssets]
    ON [dbo].[tblCDROMDriveHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

