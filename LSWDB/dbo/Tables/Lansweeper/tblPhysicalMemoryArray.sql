CREATE TABLE [dbo].[tblPhysicalMemoryArray] (
    [Win32_PhysicalMemoryArrayid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [Location]                    NUMERIC (18)   NULL,
    [MaxCapacity]                 NUMERIC (18)   NULL,
    [MemoryDevices]               NUMERIC (18)   NULL,
    [MemoryErrorCorrection]       NUMERIC (18)   NULL,
    [Tag]                         NVARCHAR (450) NULL,
    [Use]                         NUMERIC (18)   NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblPhysicalMemoryArray_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPhysicalMemoryArray] PRIMARY KEY CLUSTERED ([Win32_PhysicalMemoryArrayid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPhysicalMemoryArray_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPhysicalMemoryArray_tblAssets]
    ON [dbo].[tblPhysicalMemoryArray]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

