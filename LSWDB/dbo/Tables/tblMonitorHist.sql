CREATE TABLE [dbo].[tblMonitorHist] (
    [Trackercode]         INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT             NOT NULL,
    [MonitorModel]        NVARCHAR (300)  NULL,
    [SerialNumber]        NVARCHAR (100)  NULL,
    [MonitorManufacturer] NVARCHAR (300)  NULL,
    [ManufacturedDate]    DATETIME        NULL,
    [LastChanged]         DATETIME        CONSTRAINT [DF_tblMonitorHist_LastChanged] DEFAULT (getdate()) NOT NULL,
    [Action]              NUMERIC (18)    NOT NULL,
    [PNPDeviceID]         NVARCHAR (1024) NULL,
    CONSTRAINT [PK_tblMonitorHist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMonitorHist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMonitorHist_tblAssets]
    ON [dbo].[tblMonitorHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

