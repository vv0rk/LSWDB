CREATE TABLE [dbo].[tblPointingDevice] (
    [Win32_PointingDeviceid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Caption]                NVARCHAR (450) NULL,
    [DeviceInterface]        NUMERIC (18)   NULL,
    [DoubleSpeedThreshold]   NUMERIC (18)   NULL,
    [Handedness]             NUMERIC (18)   NULL,
    [Manufacturer]           NVARCHAR (450) NULL,
    [NumberOfButtons]        NUMERIC (18)   NULL,
    [PointingType]           NUMERIC (18)   NULL,
    [QuadSpeedThreshold]     NUMERIC (18)   NULL,
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblPointingDevice_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPointingDevice] PRIMARY KEY CLUSTERED ([Win32_PointingDeviceid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPointingDevice_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPointingDevice_tblAssets]
    ON [dbo].[tblPointingDevice]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

