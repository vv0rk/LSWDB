CREATE TABLE [dbo].[tblCodecFilehist] (
    [Trackercode]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Archive]           BIT            NULL,
    [Caption]           NVARCHAR (450) NULL,
    [Compressed]        BIT            NULL,
    [CompressionMethod] NVARCHAR (200) NULL,
    [Description]       NVARCHAR (500) NULL,
    [Drive]             NVARCHAR (20)  NULL,
    [Encrypted]         BIT            NULL,
    [EncryptionMethod]  NVARCHAR (100) NULL,
    [Extension]         NVARCHAR (50)  NULL,
    [FileName]          NVARCHAR (300) NULL,
    [FileSize]          NUMERIC (18)   NULL,
    [FileType]          NVARCHAR (300) NULL,
    [FSName]            NVARCHAR (50)  NULL,
    [Group]             NVARCHAR (50)  NULL,
    [Hidden]            BIT            NULL,
    [InstallDate]       DATETIME       NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [Status]            NVARCHAR (20)  NULL,
    [System]            BIT            NULL,
    [Version]           NVARCHAR (200) NULL,
    [lastchanged]       DATETIME       CONSTRAINT [DF_tblCodecFilehist_lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]            NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblCodecFilehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCodecFilehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCodecFilehist_tblAssets]
    ON [dbo].[tblCodecFilehist]([AssetID] ASC) WITH (FILLFACTOR = 90);

