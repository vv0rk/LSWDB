CREATE TABLE [dbo].[tblPointingDeviceHist] (
    [Trackercode]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]              INT            NOT NULL,
    [Caption]              NVARCHAR (450) NULL,
    [DeviceInterface]      NUMERIC (18)   NULL,
    [DoubleSpeedThreshold] NUMERIC (18)   NULL,
    [Handedness]           NUMERIC (18)   NULL,
    [Manufacturer]         NVARCHAR (450) NULL,
    [NumberOfButtons]      NUMERIC (18)   NULL,
    [PointingType]         NUMERIC (18)   NULL,
    [QuadSpeedThreshold]   NUMERIC (18)   NULL,
    [Lastchanged]          DATETIME       CONSTRAINT [DF_tblPointingDevicehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]               NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblPointingDevicehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPointingDevicehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPointingDevicehist_tblAssets]
    ON [dbo].[tblPointingDeviceHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

