CREATE TABLE [dbo].[tsysPackageScheduleAsset] (
    [ScheduleAssetID] INT IDENTITY (1, 1) NOT NULL,
    [ScheduleID]      INT NOT NULL,
    [AssetID]         INT NOT NULL,
    CONSTRAINT [PK_tsysPackageScheduleAsset] PRIMARY KEY CLUSTERED ([ScheduleAssetID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageScheduleAsset_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tsysPackageScheduleAsset_tsysPackageSchedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[tsysPackageSchedule] ([PackageScheduleID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageScheduleAsset_tsysPackageSchedule]
    ON [dbo].[tsysPackageScheduleAsset]([ScheduleID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageScheduleAsset_tblAssets]
    ON [dbo].[tsysPackageScheduleAsset]([AssetID] ASC) WITH (FILLFACTOR = 90);

