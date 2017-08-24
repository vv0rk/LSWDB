CREATE TABLE [dbo].[tblAssetGroups] (
    [AssetGroupID] INT            NOT NULL,
    [AssetGroup]   NVARCHAR (150) NOT NULL,
    [Builtin]      BIT            CONSTRAINT [DF_tblAssetGroups_Builtin] DEFAULT ((0)) NOT NULL,
    [Dynamic]      BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tblAssetRoles] PRIMARY KEY CLUSTERED ([AssetGroupID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AssetGroup] UNIQUE NONCLUSTERED ([AssetGroup] ASC) WITH (FILLFACTOR = 90)
);

