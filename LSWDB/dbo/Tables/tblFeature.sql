CREATE TABLE [dbo].[tblFeature] (
    [FeatureId]   INT      IDENTITY (1, 1) NOT NULL,
    [AssetId]     INT      NOT NULL,
    [featUniId]   INT      NOT NULL,
    [Lastchanged] DATETIME CONSTRAINT [DF_Feature_dateModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblFeature] PRIMARY KEY CLUSTERED ([FeatureId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblFeature_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblFeature_tblUniqueFeature] FOREIGN KEY ([featUniId]) REFERENCES [dbo].[tblFeatureUni] ([featUniID]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblFeature_tblAssets]
    ON [dbo].[tblFeature]([AssetId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblFeature_tblFeatureUni]
    ON [dbo].[tblFeature]([featUniId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

