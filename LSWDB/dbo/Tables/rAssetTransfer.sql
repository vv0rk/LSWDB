CREATE TABLE [dbo].[rAssetTransfer] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [CreateDate] DATETIME       DEFAULT (getdate()) NOT NULL,
    [Comment]    NVARCHAR (200) NULL,
    [IdStatus]   INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rAssetTransfer_rAssetTransferStatus_IdStatus_Id] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[rAssetTransferStatus] ([Id])
);

