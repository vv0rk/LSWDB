CREATE TABLE [dbo].[tblDiskPartitionHist] (
    [Trackercode]      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT            NOT NULL,
    [BlockSize]        NUMERIC (18)   NULL,
    [Bootable]         BIT            NULL,
    [BootPartition]    BIT            NULL,
    [DiskIndex]        NUMERIC (18)   NULL,
    [Index]            NUMERIC (18)   NULL,
    [NumberOfBlocks]   NUMERIC (18)   NULL,
    [PrimaryPartition] BIT            NULL,
    [Size]             NUMERIC (18)   NULL,
    [StartingOffset]   NUMERIC (18)   NULL,
    [Type]             NVARCHAR (450) NULL,
    [Lastchanged]      DATETIME       CONSTRAINT [DF_tblDiskPartitionhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]           NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblDiskPartitionhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDiskPartitionhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDiskPartitionhist_tblAssets]
    ON [dbo].[tblDiskPartitionHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

