CREATE TABLE [dbo].[tblPortableBatteryHist] (
    [Trackercode]         INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT             NOT NULL,
    [CapacityMultiplier]  NUMERIC (18)    NULL,
    [Chemistry]           NUMERIC (18)    NULL,
    [DesignCapacity]      NUMERIC (18)    NULL,
    [DesignVoltage]       NUMERIC (18)    NULL,
    [DeviceID]            NVARCHAR (1000) NULL,
    [Location]            NVARCHAR (1000) NULL,
    [ManufactureDate]     DATETIME        NULL,
    [Manufacturer]        NVARCHAR (450)  NULL,
    [MaxBatteryError]     NUMERIC (18)    NULL,
    [Name]                NVARCHAR (450)  NULL,
    [SmartBatteryVersion] NVARCHAR (450)  NULL,
    [Lastchanged]         DATETIME        CONSTRAINT [DF_tblPortableBatteryhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]              NUMERIC (18)    NOT NULL,
    CONSTRAINT [PK_tblPortableBatteryhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPortableBatteryhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPortableBatteryhist_tblAssets]
    ON [dbo].[tblPortableBatteryHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

