CREATE TABLE [dbo].[rAssetTransferSpec] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [IdAssetSource]   INT NOT NULL,
    [IdAssetTarget]   INT NOT NULL,
    [IdAssetTransfer] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rAssetTransferSpec_rAsset_IdAssetSource_AssetId] FOREIGN KEY ([IdAssetSource]) REFERENCES [dbo].[rAsset] ([AssetId]),
    CONSTRAINT [FK_rAssetTransferSpec_rAsset_IdAssetTarget_AssetId] FOREIGN KEY ([IdAssetTarget]) REFERENCES [dbo].[rAsset] ([AssetId]),
    CONSTRAINT [FK_rAssetTransferSpec_rAssetTransfer_IdAssetTransfer_Id] FOREIGN KEY ([IdAssetTransfer]) REFERENCES [dbo].[rAssetTransfer] ([Id]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransferSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];

