CREATE TABLE [dbo].[tblPageFile] (
    [Win32_PageFileid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT            NOT NULL,
    [Archive]          BIT            NULL,
    [Caption]          NVARCHAR (450) NULL,
    [CreationDate]     DATETIME       NULL,
    [FileSize]         NUMERIC (18)   NULL,
    [Hidden]           BIT            NULL,
    [InitialSize]      NUMERIC (18)   NULL,
    [InstallDate]      DATETIME       NULL,
    [MaximumSize]      NUMERIC (18)   NULL,
    [Path]             NVARCHAR (450) NULL,
    [Readable]         BIT            NULL,
    [System]           BIT            NULL,
    [Writeable]        BIT            NULL,
    [Lastchanged]      DATETIME       CONSTRAINT [DF_tblPageFile_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPageFile] PRIMARY KEY CLUSTERED ([Win32_PageFileid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPageFile_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPageFile_tblAssets]
    ON [dbo].[tblPageFile]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

