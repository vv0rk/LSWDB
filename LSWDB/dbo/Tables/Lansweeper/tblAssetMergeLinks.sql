CREATE TABLE [dbo].[tblAssetMergeLinks] (
    [AssetMergeLinkID] INT IDENTITY (1, 1) NOT NULL,
    [OldAssetID]       INT NOT NULL,
    [NewAssetID]       INT NOT NULL,
    CONSTRAINT [PK_tblAssetMergeLinks] PRIMARY KEY CLUSTERED ([AssetMergeLinkID] ASC) WITH (FILLFACTOR = 90)
);

