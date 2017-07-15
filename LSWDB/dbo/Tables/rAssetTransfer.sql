CREATE TABLE [dbo].[rAssetTransfer] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [CreateDate] DATETIME       DEFAULT (getdate()) NOT NULL,
    [Comment]    NVARCHAR (200) NULL,
    [IdStatus]   INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rAssetTransfer_rAssetTransferStatus_IdStatus_Id] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[rAssetTransferStatus] ([Id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];

