CREATE TABLE [dbo].[tblAssetDocs] (
    [DocsID]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID] INT            NOT NULL,
    [Docname] NVARCHAR (255) NOT NULL,
    [Docguid] NVARCHAR (100) NOT NULL,
    [AddedBy] NVARCHAR (150) NOT NULL,
    [Added]   DATETIME       CONSTRAINT [DF_tblAssetDocs_Added] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblAssetDocs] PRIMARY KEY CLUSTERED ([DocsID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblAssetDocs_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAssetDocs_tblAssets]
    ON [dbo].[tblAssetDocs]([AssetID] ASC) WITH (FILLFACTOR = 90);

