CREATE TABLE [dbo].[rPrintHist_OLD] (
    [AssetId]          INT            NOT NULL,
    [Company]          NVARCHAR (255) NULL,
    [City]             NVARCHAR (255) NULL,
    [Address]          NVARCHAR (255) NULL,
    [Officenr]         NVARCHAR (255) NULL,
    [placenr]          NVARCHAR (255) NULL,
    [datecheck]        DATETIME       NULL,
    [printedpages]     NUMERIC (18)   NULL,
    [IdMaterialRashod] INT            NULL,
    [IdAssetTransfer]  INT            NULL,
    [Id]               INT            NOT NULL,
    CONSTRAINT [FK_rPrintHist_rAssetTransfer_IdAssetTransfer] FOREIGN KEY ([IdAssetTransfer]) REFERENCES [dbo].[rAssetTransfer] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_rPrintHist_rRashodMaterial_IdMaterialRashod] FOREIGN KEY ([IdMaterialRashod]) REFERENCES [dbo].[rMaterialRashod] ([Id]) ON DELETE CASCADE
);

