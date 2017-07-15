CREATE TABLE [dbo].[tblVideoControllerHist] (
    [Trackercode]                 INT            IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblVideoControllerhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblVideoControllerhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVideoControllerhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVideoControllerhist_tblAssets]
    ON [dbo].[tblVideoControllerHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

