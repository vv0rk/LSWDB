CREATE TABLE [dbo].[tblMonitor] (
    [MonitorID]           INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT             NOT NULL,
    [MonitorModel]        NVARCHAR (300)  NULL,
    [SerialNumber]        NVARCHAR (100)  NULL,
    [MonitorManufacturer] NVARCHAR (400)  NULL,
    [ManufacturedDate]    DATETIME        NULL,
    [LastChanged]         DATETIME        CONSTRAINT [DF_tblMonitor_LastChanged] DEFAULT (getdate()) NOT NULL,
    [PNPDeviceID]         NVARCHAR (1024) NULL,
    CONSTRAINT [PK_tblMonitor] PRIMARY KEY CLUSTERED ([MonitorID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblMonitor_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMonitor_tblAssets]
    ON [dbo].[tblMonitor]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

