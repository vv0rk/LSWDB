CREATE TABLE [dbo].[tblInfraredDeviceHist] (
    [Trackercode]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Availability]            NUMERIC (18)   NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]  NUMERIC (18)   NULL,
    [ConfigManagerUserConfig] BIT            NULL,
    [Manufacturer]            NVARCHAR (450) NULL,
    [ProtocolSupported]       BIT            NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblInfraredDevicehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                  NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblInfraredDevicehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblInfraredDevicehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblInfraredDevicehist_tblAssets]
    ON [dbo].[tblInfraredDeviceHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

