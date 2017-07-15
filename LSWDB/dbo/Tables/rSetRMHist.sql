CREATE TABLE [dbo].[rSetRMHist] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]          INT            NOT NULL,
    [Custom1]          NVARCHAR (255) NULL,
    [Custom2]          NVARCHAR (255) NULL,
    [Custom3]          NVARCHAR (255) NULL,
    [Custom4]          NVARCHAR (255) NULL,
    [Custom5]          NVARCHAR (255) NULL,
    [Date]             DATETIME       DEFAULT (getdate()) NULL,
    [User]             NVARCHAR (100) NULL,
    [IdMaterialAnalog] INT            NOT NULL,
    [IdMaterialRashod] INT            NULL,
    [PrintedPages]     INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rSetRMHist_rMaterialAnalog] FOREIGN KEY ([IdMaterialAnalog]) REFERENCES [dbo].[rMaterialAnalog] ([Id]),
    CONSTRAINT [FK_rSetRMHist_rRashodMaterial_IdMaterialRashod] FOREIGN KEY ([IdMaterialRashod]) REFERENCES [dbo].[rMaterialRashod] ([Id]) ON DELETE CASCADE
);

