CREATE TABLE [dbo].[tblCodecFile] (
    [Win32_CodecFileid] INT            IDENTITY (1, 1) NOT NULL,
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
    [lastchanged]       DATETIME       CONSTRAINT [DF_tblCodecFile_lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblCodecFile] PRIMARY KEY CLUSTERED ([Win32_CodecFileid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCodecFile_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblCodecFile_5_1104111074__K2]
    ON [dbo].[tblCodecFile]([AssetID] ASC) WITH (FILLFACTOR = 90);

