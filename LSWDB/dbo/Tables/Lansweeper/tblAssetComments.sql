CREATE TABLE [dbo].[tblAssetComments] (
    [CommentID] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]   INT             NOT NULL,
    [Comment]   NVARCHAR (4000) NOT NULL,
    [AddedBy]   NVARCHAR (150)  NOT NULL,
    [Added]     DATETIME        CONSTRAINT [DF_tblAssetNotes_Added] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblAssetNotes] PRIMARY KEY CLUSTERED ([CommentID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssetNotes_tblassets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAssetNotes_tblassets]
    ON [dbo].[tblAssetComments]([AssetID] ASC) WITH (FILLFACTOR = 90);

