CREATE TABLE [dbo].[tblBIOSHist] (
    [Trackercode]          INT            IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]          DATETIME       CONSTRAINT [DF_tblBIOShist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]               NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblBIOShist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBIOShist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBIOShist_tblAssets]
    ON [dbo].[tblBIOSHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

