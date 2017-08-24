CREATE TABLE [dbo].[tblDiskPartition] (
    [Win32_DiskPartitionid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [BlockSize]             NUMERIC (18)   NULL,
    [Bootable]              BIT            NULL,
    [BootPartition]         BIT            NULL,
    [DiskIndex]             NUMERIC (18)   NULL,
    [Index]                 NUMERIC (18)   NULL,
    [NumberOfBlocks]        NUMERIC (18)   NULL,
    [PrimaryPartition]      BIT            NULL,
    [Size]                  NUMERIC (18)   NULL,
    [StartingOffset]        NUMERIC (18)   NULL,
    [Type]                  NVARCHAR (450) NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblDiskPartition_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblDiskPartition] PRIMARY KEY CLUSTERED ([Win32_DiskPartitionid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDiskPartition_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDiskPartition_tblAssets]
    ON [dbo].[tblDiskPartition]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

