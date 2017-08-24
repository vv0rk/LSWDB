CREATE TABLE [dbo].[tblScanHistory] (
    [ScanHistoryId]    INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]          INT            NOT NULL,
    [ScanServer]       NVARCHAR (60)  NOT NULL,
    [ScanningMethodId] INT            NOT NULL,
    [Description]      NVARCHAR (500) NULL,
    [ScanTime]         DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([ScanHistoryId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblScanHistory_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblScanHistory_tsysScanningMethods] FOREIGN KEY ([ScanningMethodId]) REFERENCES [dbo].[tsysScanningMethods] ([ScanningMethodId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblScanHistory_tblAssets]
    ON [dbo].[tblScanHistory]([AssetId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblScanHistory_tsysScanningMethods]
    ON [dbo].[tblScanHistory]([ScanningMethodId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblScanHistory_ScanTime]
    ON [dbo].[tblScanHistory]([ScanTime] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

