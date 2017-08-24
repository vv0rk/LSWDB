CREATE TABLE [dbo].[tblDesktopMonitorHist] (
    [Trackercode]           INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT             NOT NULL,
    [Availability]          NUMERIC (18)    NULL,
    [Caption]               NVARCHAR (450)  NULL,
    [DeviceID]              NVARCHAR (450)  NULL,
    [MonitorManufacturer]   NVARCHAR (450)  NULL,
    [PixelsPerXLogicalInch] NUMERIC (18)    NULL,
    [PixelsPerYLogicalInch] NUMERIC (18)    NULL,
    [ScreenHeight]          NUMERIC (18)    NULL,
    [ScreenWidth]           NUMERIC (18)    NULL,
    [Lastchanged]           DATETIME        CONSTRAINT [DF_tblDesktopMonitorhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                NUMERIC (18)    NOT NULL,
    [PNPDeviceID]           NVARCHAR (1024) NULL,
    CONSTRAINT [PK_tblDesktopMonitorhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDesktopMonitorhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDesktopMonitorhist_tblAssets]
    ON [dbo].[tblDesktopMonitorHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

