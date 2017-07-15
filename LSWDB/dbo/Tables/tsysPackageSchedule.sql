CREATE TABLE [dbo].[tsysPackageSchedule] (
    [PackageScheduleID]        INT             IDENTITY (1, 1) NOT NULL,
    [LinkType]                 INT             NULL,
    [ScheduleID]               INT             NULL,
    [CreationDate]             DATETIME        NULL,
    [ModificationDate]         DATETIME        NULL,
    [Executor]                 NVARCHAR (100)  NULL,
    [Creator]                  NVARCHAR (100)  NULL,
    [Modifier]                 NVARCHAR (100)  NULL,
    [RunNow]                   BIT             CONSTRAINT [DF_tsysPackageSchedule_RunNow] DEFAULT ((0)) NULL,
    [PackageID]                INT             NULL,
    [Reportquery]              NVARCHAR (200)  NULL,
    [AssetGroupID]             INT             NULL,
    [Enabled]                  BIT             DEFAULT ((1)) NOT NULL,
    [Visible]                  BIT             DEFAULT ((1)) NOT NULL,
    [WOL]                      BIT             NULL,
    [WOLTime]                  INT             NULL,
    [ReportParams]             NVARCHAR (200)  NULL,
    [RetryDate]                DATETIME        NULL,
    [RetryTime]                INT             NULL,
    [DeployAfterScan]          BIT             NULL,
    [RunMode]                  INT             NULL,
    [PackageScheduleReference] INT             NULL,
    [Filters]                  NVARCHAR (2000) NULL,
    [HasChanged]               BIT             DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PackageScheduleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageSchedule_tblAssetGroups] FOREIGN KEY ([AssetGroupID]) REFERENCES [dbo].[tblAssetGroups] ([AssetGroupID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tsysPackageSchedule_tsysPackages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[tsysPackages] ([PackageID]),
    CONSTRAINT [FK_tsysPackageSchedule_tsysSchedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[tsysSchedule] ([ScheduleID])
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSchedule_tblAssetGroups]
    ON [dbo].[tsysPackageSchedule]([AssetGroupID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSchedule_tsysPackages]
    ON [dbo].[tsysPackageSchedule]([PackageID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSchedule_tsysSchedule]
    ON [dbo].[tsysPackageSchedule]([ScheduleID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSchedule_tsysreports]
    ON [dbo].[tsysPackageSchedule]([Reportquery] ASC) WITH (FILLFACTOR = 90);

