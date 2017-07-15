CREATE TABLE [dbo].[tblSystemEnclosureHist] (
    [Trackercode]    INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT            NOT NULL,
    [ChassisTypes]   NUMERIC (18)   NULL,
    [LockPresent]    BIT            NULL,
    [Manufacturer]   NVARCHAR (450) NULL,
    [SecurityStatus] NUMERIC (18)   NULL,
    [SerialNumber]   NVARCHAR (300) NULL,
    [SMBIOSAssetTag] NVARCHAR (300) NULL,
    [Version]        NVARCHAR (300) NULL,
    [Lastchanged]    DATETIME       CONSTRAINT [DF_tblSystemEnclosurehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]         NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblSystemEnclosurehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSystemEnclosurehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSystemEnclosurehist_tblAssets]
    ON [dbo].[tblSystemEnclosureHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

