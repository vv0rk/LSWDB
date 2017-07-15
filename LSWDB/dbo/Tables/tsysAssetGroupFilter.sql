CREATE TABLE [dbo].[tsysAssetGroupFilter] (
    [FilterID]            INT             IDENTITY (1, 1) NOT NULL,
    [AssetGroupID]        INT             NOT NULL,
    [Compare]             INT             NOT NULL,
    [Operator]            INT             NOT NULL,
    [Comparevalue]        NVARCHAR (2000) NOT NULL,
    [VersionCompareValue] NVARCHAR (200)  NULL,
    CONSTRAINT [PK_tblAssetGroupFilter] PRIMARY KEY CLUSTERED ([FilterID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysAssetGroupFilter_tblAssetGroups] FOREIGN KEY ([AssetGroupID]) REFERENCES [dbo].[tblAssetGroups] ([AssetGroupID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetGroupFilter_tblAssetGroups]
    ON [dbo].[tsysAssetGroupFilter]([AssetGroupID] ASC) WITH (FILLFACTOR = 90);

