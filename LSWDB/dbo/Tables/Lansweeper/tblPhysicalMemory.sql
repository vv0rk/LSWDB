CREATE TABLE [dbo].[tblPhysicalMemory] (
    [Win32_PhysicalMemoryid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Capacity]               NUMERIC (18)   NULL,
    [DataWidth]              NUMERIC (18)   NULL,
    [DeviceLocator]          NVARCHAR (400) NULL,
    [FormFactor]             NUMERIC (18)   NULL,
    [InterleaveDataDepth]    NUMERIC (18)   NULL,
    [InterleavePosition]     NUMERIC (18)   NULL,
    [MemoryType]             INT            NULL,
    [PositionInRow]          NUMERIC (18)   NULL,
    [Speed]                  NUMERIC (18)   NULL,
    [TotalWidth]             NUMERIC (18)   NULL,
    [TypeDetail]             NUMERIC (18)   NULL,
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblPhysicalMemory_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPhysicalMemory] PRIMARY KEY CLUSTERED ([Win32_PhysicalMemoryid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPhysicalMemory_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblPhysicalMemory_7_847446193__K10_K2_4]
    ON [dbo].[tblPhysicalMemory]([MemoryType] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPhysicalMemory_tblAssets]
    ON [dbo].[tblPhysicalMemory]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

