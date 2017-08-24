CREATE TABLE [dbo].[tblVmwareDisk] (
    [DiskID]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Name]        NVARCHAR (255)  NULL,
    [Url]         NVARCHAR (1024) NULL,
    [TotalSpace]  NUMERIC (18)    NULL,
    [FreeSpace]   NUMERIC (18)    NULL,
    [lastchanged] DATETIME        CONSTRAINT [DF_tblVmwareDisk_lastchanged] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tblVmwareDisk] PRIMARY KEY CLUSTERED ([DiskID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblVmwareDisk_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVmwareDisk_tblAssets]
    ON [dbo].[tblVmwareDisk]([AssetID] ASC) WITH (FILLFACTOR = 90);

