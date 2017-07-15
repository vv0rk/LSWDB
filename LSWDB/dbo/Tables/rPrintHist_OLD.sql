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


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrintHist_OLD] TO [IE\UIT_USERS_VR]
    AS [dbo];

