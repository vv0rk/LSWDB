CREATE TABLE [dbo].[tblAssetGroupLink] (
    [AssetGroupLinkID] BIGINT IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT    NOT NULL,
    [AssetGroupID]     INT    CONSTRAINT [DF_tblAssetGroupLink_AssetGroupID] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tblAssetRoleLink] PRIMARY KEY CLUSTERED ([AssetGroupLinkID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssetRoleLink_tblAssetRoles] FOREIGN KEY ([AssetGroupID]) REFERENCES [dbo].[tblAssetGroups] ([AssetGroupID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblAssetRoleLink_tblassets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [AssetGroupLink] UNIQUE NONCLUSTERED ([AssetID] ASC, [AssetGroupID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetGroupLink_7_21783335__K3_K2]
    ON [dbo].[tblAssetGroupLink]([AssetGroupID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAssetRoleLink_tblassets]
    ON [dbo].[tblAssetGroupLink]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

