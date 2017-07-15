CREATE TABLE [dbo].[tblBattery] (
    [Win32_Batteryid]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [Availability]                NUMERIC (18)   NULL,
    [BatteryStatus]               NUMERIC (18)   NULL,
    [Chemistry]                   NUMERIC (18)   NULL,
    [DesignCapacity]              NUMERIC (18)   NULL,
    [DeviceID]                    NVARCHAR (450) NULL,
    [Name]                        NVARCHAR (450) NULL,
    [PowerManagementCapabilities] VARCHAR (400)  NULL,
    [PowerManagementSupported]    BIT            NULL,
    [SmartBatteryVersion]         NVARCHAR (50)  NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblBattery_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblBattery] PRIMARY KEY CLUSTERED ([Win32_Batteryid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBattery_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBattery_tblAssets]
    ON [dbo].[tblBattery]([AssetID] ASC) WITH (FILLFACTOR = 90);

