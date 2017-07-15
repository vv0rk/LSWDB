CREATE TABLE [dbo].[rTransferSpec] (
    [Id]           INT      IDENTITY (1, 1) NOT NULL,
    [IdTransfer]   INT      NOT NULL,
    [IdOriginal]   INT      NULL,
    [Id1CSprav]    INT      NOT NULL,
    [Number]       INT      NOT NULL,
    [IdUserCreate] INT      NULL,
    [DateCreation] DATETIME DEFAULT (getdate()) NOT NULL,
    [IdUserUpdate] INT      NULL,
    [DateUpdate]   DATETIME DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rTransfer_rOriginal_IdOriginal] FOREIGN KEY ([IdOriginal]) REFERENCES [dbo].[rMaterialOriginal] ([Id]),
    CONSTRAINT [FK_rTransferSpec_r1CSprav_Id] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id]),
    CONSTRAINT [FK_rTransferSpec_rTransfer_IdTransfer] FOREIGN KEY ([IdTransfer]) REFERENCES [dbo].[rTransfer] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_rUser_rTransferSpec_idUserCreate] FOREIGN KEY ([IdUserCreate]) REFERENCES [dbo].[rUser] ([Id]),
    CONSTRAINT [FK_rUser_rTransferSpec_idUserUpdate] FOREIGN KEY ([IdUserUpdate]) REFERENCES [dbo].[rUser] ([Id])
);

