CREATE TABLE [dbo].[tblInfraredDevice] (
    [Win32_InfraredDeviceid]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Availability]            NUMERIC (18)   NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]  NUMERIC (18)   NULL,
    [ConfigManagerUserConfig] BIT            NULL,
    [Manufacturer]            NVARCHAR (450) NULL,
    [ProtocolSupported]       BIT            NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblInfraredDevice_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblInfraredDevice] PRIMARY KEY CLUSTERED ([Win32_InfraredDeviceid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblInfraredDevice_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblInfraredDevice_tblAssets]
    ON [dbo].[tblInfraredDevice]([AssetID] ASC) WITH (FILLFACTOR = 90);

