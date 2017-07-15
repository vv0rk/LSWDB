CREATE TABLE [dbo].[tblPhysicalMemoryArrayHist] (
    [Trackercode]           INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Location]              NUMERIC (18)   NULL,
    [MaxCapacity]           NUMERIC (18)   NULL,
    [MemoryDevices]         NUMERIC (18)   NULL,
    [MemoryErrorCorrection] NUMERIC (18)   NULL,
    [Tag]                   NVARCHAR (450) NULL,
    [Use]                   NUMERIC (18)   NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblPhysicalMemoryArrayhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblPhysicalMemoryArrayhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPhysicalMemoryArrayhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPhysicalMemoryArrayhist_tblAssets]
    ON [dbo].[tblPhysicalMemoryArrayHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

