CREATE TABLE [dbo].[tblAssetRelations] (
    [RelationID]    INT            IDENTITY (1, 1) NOT NULL,
    [ParentAssetID] INT            NULL,
    [ChildAssetID]  INT            NULL,
    [Type]          INT            NULL,
    [Comments]      NVARCHAR (150) NULL,
    [Lastchanged]   DATETIME       CONSTRAINT [DF_tblAssetRelations_LastChanged] DEFAULT (getdate()) NOT NULL,
    [posX]          INT            NULL,
    [posY]          INT            NULL,
    [StartDate]     DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([RelationID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssetRelations_tblAssets] FOREIGN KEY ([ParentAssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetRelations_tblAssets]
    ON [dbo].[tblAssetRelations]([ParentAssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

