CREATE TABLE [dbo].[tblUptime] (
    [UptimeID]  INT      IDENTITY (1, 1) NOT NULL,
    [AssetId]   INT      NOT NULL,
    [EventTime] DATETIME NOT NULL,
    [EventType] TINYINT  NOT NULL,
    CONSTRAINT [PK_tblUptime] PRIMARY KEY CLUSTERED ([UptimeID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUptime_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblUptime_tblAssets]
    ON [dbo].[tblUptime]([AssetId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblUptime_AssetId_EventTime_EventType]
    ON [dbo].[tblUptime]([AssetId] ASC, [EventTime] ASC, [EventType] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblUptime_EventTime]
    ON [dbo].[tblUptime]([EventTime] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

