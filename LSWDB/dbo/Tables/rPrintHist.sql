CREATE TABLE [dbo].[rPrintHist] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
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
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rPrintHist_rAssetTransfer_IdAssetTransfer_new] FOREIGN KEY ([IdAssetTransfer]) REFERENCES [dbo].[rAssetTransfer] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_rPrintHist_rRashodMaterial_IdMaterialRashod_new] FOREIGN KEY ([IdMaterialRashod]) REFERENCES [dbo].[rMaterialRashod] ([Id]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rPrintHist] TO [UIT_USERS Role]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist] TO [UIT_USERS Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist] TO [UIT_USERS Role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist] TO [UIT_USERS Role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist] TO [UIT_USERS Role]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist] TO [IE\UIT_USERS_VR]
    AS [dbo];

