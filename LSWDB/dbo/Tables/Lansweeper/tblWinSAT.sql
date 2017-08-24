CREATE TABLE [dbo].[tblWinSAT] (
    [WinSatId]              INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]               INT            NOT NULL,
    [CPUScore]              DECIMAL (4, 1) NULL,
    [D3DScore]              DECIMAL (4, 1) NULL,
    [DiskScore]             DECIMAL (4, 1) NULL,
    [GraphicsScore]         DECIMAL (4, 1) NULL,
    [MemoryScore]           DECIMAL (4, 1) NULL,
    [WinSPRLevel]           DECIMAL (4, 1) NULL,
    [WinSATAssessmentState] TINYINT        NULL,
    [LastChanged]           DATETIME       CONSTRAINT [DF_tblWinSAT_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblWinSAT] PRIMARY KEY CLUSTERED ([WinSatId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblWinSAT_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblWinSAT_tblAssets]
    ON [dbo].[tblWinSAT]([AssetId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

