CREATE TABLE [dbo].[tblVideoController] (
    [Win32_VideoControllerid]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [AdapterCompatibility]        NVARCHAR (450) NULL,
    [AdapterRAM]                  NUMERIC (18)   NULL,
    [Availability]                NUMERIC (18)   NULL,
    [Caption]                     NVARCHAR (450) NULL,
    [CurrentBitsPerPixel]         NUMERIC (18)   NULL,
    [CurrentHorizontalResolution] NUMERIC (18)   NULL,
    [CurrentNumberOfColors]       NUMERIC (18)   NULL,
    [CurrentRefreshRate]          NUMERIC (18)   NULL,
    [CurrentScanMode]             NUMERIC (18)   NULL,
    [CurrentVerticalResolution]   NUMERIC (18)   NULL,
    [DeviceID]                    NVARCHAR (500) NULL,
    [DeviceSpecificPens]          NUMERIC (18)   NULL,
    [DriverVersion]               NVARCHAR (100) NULL,
    [MaxRefreshRate]              NUMERIC (18)   NULL,
    [MinRefreshRate]              NUMERIC (18)   NULL,
    [Monochrome]                  BIT            NULL,
    [NumberOfColorPlanes]         NUMERIC (18)   NULL,
    [VideoArchitecture]           NUMERIC (18)   NULL,
    [VideoMemoryType]             NUMERIC (18)   NULL,
    [VideoModeDescription]        NVARCHAR (500) NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblVideoController_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblVideoController] PRIMARY KEY CLUSTERED ([Win32_VideoControllerid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblVideoController_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblVideoController_7_590833367__K7_K2_8066]
    ON [dbo].[tblVideoController]([CurrentBitsPerPixel] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblVideoController_7_590833367__K8_K2_4364]
    ON [dbo].[tblVideoController]([CurrentHorizontalResolution] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVideoController_tblAssets]
    ON [dbo].[tblVideoController]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

