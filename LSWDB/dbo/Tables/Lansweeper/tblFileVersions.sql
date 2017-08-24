CREATE TABLE [dbo].[tblFileVersions] (
    [VersionID]    INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]      INT             NOT NULL,
    [Found]        BIT             CONSTRAINT [DF_tblFileVersions_Found] DEFAULT ((0)) NULL,
    [FilePathfull] NVARCHAR (1000) NULL,
    [FileVersion]  NVARCHAR (100)  NULL,
    [CompanyName]  NVARCHAR (300)  NULL,
    [Filesize]     NUMERIC (18)    NULL,
    [Lastchanged]  DATETIME        CONSTRAINT [DF_tblFileVersions_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [CreationDate] DATETIME        NULL,
    [LastAccessed] DATETIME        NULL,
    [LastModified] DATETIME        NULL,
    CONSTRAINT [PK_tblFileVersions] PRIMARY KEY CLUSTERED ([VersionID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblFileVersions_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblFileVersions_tblAssets]
    ON [dbo].[tblFileVersions]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

