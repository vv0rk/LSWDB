CREATE TABLE [dbo].[tblAssetUserRelations] (
    [RelationID]  INT            IDENTITY (1, 1) NOT NULL,
    [Username]    NVARCHAR (150) NULL,
    [Userdomain]  NVARCHAR (150) NULL,
    [AssetID]     INT            NULL,
    [Type]        INT            NULL,
    [Comments]    NVARCHAR (150) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblAssetUserRelations_LastChanged] DEFAULT (getdate()) NOT NULL,
    [StartDate]   DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([RelationID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblAssetUserRelations_tblADusers] FOREIGN KEY ([Username], [Userdomain]) REFERENCES [dbo].[tblADusers] ([Username], [Userdomain]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblAssetUserRelations_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblADusers]
    ON [dbo].[tblAssetUserRelations]([Userdomain] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblADusers_2]
    ON [dbo].[tblAssetUserRelations]([Username] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblAssets]
    ON [dbo].[tblAssetUserRelations]([AssetID] ASC) WITH (FILLFACTOR = 90);

