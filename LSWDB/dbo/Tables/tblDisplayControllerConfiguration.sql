CREATE TABLE [dbo].[tblDisplayControllerConfiguration] (
    [Win32_DisplayControllerConfigurationid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                                INT            NOT NULL,
    [BitsPerPixel]                           NUMERIC (18)   NULL,
    [Caption]                                NVARCHAR (450) NULL,
    [ColorPlanes]                            NUMERIC (18)   NULL,
    [DeviceEntriesInAColorTable]             NUMERIC (18)   NULL,
    [DeviceSpecificPens]                     NUMERIC (18)   NULL,
    [HorizontalResolution]                   NUMERIC (18)   NULL,
    [RefreshRate]                            NUMERIC (18)   NULL,
    [VerticalResolution]                     NUMERIC (18)   NULL,
    [VideoMode]                              NVARCHAR (300) NULL,
    [Lastchanged]                            DATETIME       CONSTRAINT [DF_tblDisplayControllerConfiguration_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblDisplayControllerConfiguration] PRIMARY KEY CLUSTERED ([Win32_DisplayControllerConfigurationid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDisplayControllerConfiguration_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDisplayControllerConfiguration_tblAssets]
    ON [dbo].[tblDisplayControllerConfiguration]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

