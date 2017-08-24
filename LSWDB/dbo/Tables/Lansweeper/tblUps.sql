CREATE TABLE [dbo].[tblUps] (
    [UpsId]                     INT             IDENTITY (1, 1) NOT NULL,
    [AssetId]                   INT             NOT NULL,
    [Manufacturer]              NVARCHAR (1024) NULL,
    [Model]                     NVARCHAR (1024) NULL,
    [UpsSoftwareVersion]        NVARCHAR (1024) NULL,
    [AgentSoftwareVersion]      NVARCHAR (1024) NULL,
    [Name]                      NVARCHAR (1024) NULL,
    [AttachedDevices]           NVARCHAR (1024) NULL,
    [BatteryStatus]             INT             NULL,
    [SecondsOnBattery]          INT             NULL,
    [EstimatedMinutesRemaining] INT             NULL,
    [EstimatedChargeRemaining]  INT             NULL,
    [BatteryVoltage]            INT             NULL,
    [BatteryCurrent]            INT             NULL,
    [BatteryTemperature]        INT             NULL,
    [AlarmsPresent]             INT             NULL,
    [LastChanged]               DATETIME        CONSTRAINT [DF_tblUps_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblUps] PRIMARY KEY CLUSTERED ([UpsId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUps_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblUps_tblAssets]
    ON [dbo].[tblUps]([AssetId] ASC) WITH (FILLFACTOR = 90);

