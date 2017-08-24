CREATE TABLE [dbo].[tblPhysicalMemoryHist] (
    [Trackercode]         INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT            NOT NULL,
    [Capacity]            NUMERIC (18)   NULL,
    [DataWidth]           NUMERIC (18)   NULL,
    [DeviceLocator]       NVARCHAR (400) NULL,
    [FormFactor]          NUMERIC (18)   NULL,
    [InterleaveDataDepth] NUMERIC (18)   NULL,
    [InterleavePosition]  NUMERIC (18)   NULL,
    [MemoryType]          NUMERIC (18)   NULL,
    [PositionInRow]       NUMERIC (18)   NULL,
    [Speed]               NUMERIC (18)   NULL,
    [TotalWidth]          NUMERIC (18)   NULL,
    [TypeDetail]          NUMERIC (18)   NULL,
    [Lastchanged]         DATETIME       CONSTRAINT [DF_tblPhysicalMemoryhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]              NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblPhysicalMemoryhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPhysicalMemoryhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPhysicalMemoryhist_tblAssets]
    ON [dbo].[tblPhysicalMemoryHist]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

