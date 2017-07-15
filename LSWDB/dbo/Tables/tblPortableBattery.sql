CREATE TABLE [dbo].[tblPortableBattery] (
    [Win32_PortableBatteryid] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT             NOT NULL,
    [CapacityMultiplier]      NUMERIC (18)    NULL,
    [Chemistry]               NUMERIC (18)    NULL,
    [DesignCapacity]          NUMERIC (18)    NULL,
    [DesignVoltage]           NUMERIC (18)    NULL,
    [DeviceID]                NVARCHAR (1000) NULL,
    [Location]                NVARCHAR (1000) NULL,
    [ManufactureDate]         DATETIME        NULL,
    [Manufacturer]            NVARCHAR (450)  NULL,
    [MaxBatteryError]         NUMERIC (18)    NULL,
    [Name]                    NVARCHAR (450)  NULL,
    [SmartBatteryVersion]     NVARCHAR (450)  NULL,
    [Lastchanged]             DATETIME        CONSTRAINT [DF_tblPortableBattery_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPortableBattery] PRIMARY KEY CLUSTERED ([Win32_PortableBatteryid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPortableBattery_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPortableBattery_tblAssets]
    ON [dbo].[tblPortableBattery]([AssetID] ASC) WITH (FILLFACTOR = 90);

