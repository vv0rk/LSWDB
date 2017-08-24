CREATE TABLE [dbo].[tblComponentCategory] (
    [Win32_ComponentCategoryid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                   INT            NOT NULL,
    [Caption]                   NVARCHAR (450) NULL,
    [CategoryId]                NVARCHAR (100) NULL,
    [Lastchanged]               DATETIME       CONSTRAINT [DF_tblComponentCategory_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblComponentCategory] PRIMARY KEY CLUSTERED ([Win32_ComponentCategoryid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblComponentCategory_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblComponentCategory_tblAssets]
    ON [dbo].[tblComponentCategory]([AssetID] ASC) WITH (FILLFACTOR = 90);

