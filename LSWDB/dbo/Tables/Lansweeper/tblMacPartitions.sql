CREATE TABLE [dbo].[tblMacPartitions] (
    [HardDiskID]  INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT           NOT NULL,
    [Filesystem]  NVARCHAR (50) NULL,
    [Size]        NVARCHAR (20) NULL,
    [Used]        NVARCHAR (20) NULL,
    [Available]   NVARCHAR (20) NULL,
    [Percentage]  NVARCHAR (10) NULL,
    [MountedOn]   NVARCHAR (50) NULL,
    [LastChanged] DATETIME      CONSTRAINT [DF_tblMacPartitions_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacPartitions] PRIMARY KEY CLUSTERED ([HardDiskID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacPartitions_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacPartitions_tblAssets]
    ON [dbo].[tblMacPartitions]([AssetID] ASC) WITH (FILLFACTOR = 90);

