CREATE TABLE [dbo].[tblDisplayControllerConfigurationHist] (
    [Trackercode]                INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                    INT            NOT NULL,
    [BitsPerPixel]               NUMERIC (18)   NULL,
    [Caption]                    NVARCHAR (450) NULL,
    [ColorPlanes]                NUMERIC (18)   NULL,
    [DeviceEntriesInAColorTable] NUMERIC (18)   NULL,
    [DeviceSpecificPens]         NUMERIC (18)   NULL,
    [HorizontalResolution]       NUMERIC (18)   NULL,
    [RefreshRate]                NUMERIC (18)   NULL,
    [VerticalResolution]         NUMERIC (18)   NULL,
    [VideoMode]                  NVARCHAR (300) NULL,
    [Lastchanged]                DATETIME       CONSTRAINT [DF_tblDisplayControllerConfigurationhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                     NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblDisplayControllerConfigurationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDisplayControllerConfigurationhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDisplayControllerConfigurationhist_tblAssets]
    ON [dbo].[tblDisplayControllerConfigurationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

