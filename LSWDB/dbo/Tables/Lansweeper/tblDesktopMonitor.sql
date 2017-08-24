CREATE TABLE [dbo].[tblDesktopMonitor] (
    [Win32_DesktopMonitorid] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT             NOT NULL,
    [Availability]           NUMERIC (18)    NULL,
    [Caption]                NVARCHAR (450)  NULL,
    [DeviceID]               NVARCHAR (450)  NULL,
    [MonitorManufacturer]    NVARCHAR (450)  NULL,
    [PixelsPerXLogicalInch]  NUMERIC (18)    NULL,
    [PixelsPerYLogicalInch]  NUMERIC (18)    NULL,
    [ScreenHeight]           NUMERIC (18)    NULL,
    [ScreenWidth]            NUMERIC (18)    NULL,
    [Lastchanged]            DATETIME        CONSTRAINT [DF_tblDesktopMonitor_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [PNPDeviceID]            NVARCHAR (1024) NULL,
    CONSTRAINT [PK__tblDesktopMonitor] PRIMARY KEY CLUSTERED ([Win32_DesktopMonitorid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDesktopMonitor_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDesktopMonitor_tblAssets]
    ON [dbo].[tblDesktopMonitor]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

