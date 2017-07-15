CREATE TABLE [dbo].[tblComponentCategoryHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Caption]     NVARCHAR (450) NULL,
    [CategoryId]  NVARCHAR (100) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblComponentCategoryhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblComponentCategoryhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblComponentCategoryhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblComponentCategoryhist_tblAssets]
    ON [dbo].[tblComponentCategoryHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

