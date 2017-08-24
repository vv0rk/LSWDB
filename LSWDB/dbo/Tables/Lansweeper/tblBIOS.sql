CREATE TABLE [dbo].[tblBIOS] (
    [Win32_BIOSid]         INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]              INT            NOT NULL,
    [BiosCharacteristics]  VARCHAR (400)  NULL,
    [Caption]              NVARCHAR (450) NULL,
    [CurrentLanguage]      NVARCHAR (500) NULL,
    [InstallableLanguages] NUMERIC (18)   NULL,
    [Manufacturer]         NVARCHAR (450) NULL,
    [PrimaryBIOS]          BIT            NULL,
    [ReleaseDate]          DATETIME       NULL,
    [SerialNumber]         NVARCHAR (100) NULL,
    [SMBIOSBIOSVersion]    NVARCHAR (200) NULL,
    [SMBIOSMajorVersion]   NUMERIC (18)   NULL,
    [SMBIOSMinorVersion]   NUMERIC (18)   NULL,
    [SMBIOSPresent]        BIT            NULL,
    [Version]              NVARCHAR (200) NULL,
    [Lastchanged]          DATETIME       CONSTRAINT [DF_tblBIOS_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblBIOS] PRIMARY KEY CLUSTERED ([Win32_BIOSid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblBIOS_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBIOS_tblAssets]
    ON [dbo].[tblBIOS]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

