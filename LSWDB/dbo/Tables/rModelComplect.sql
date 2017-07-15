CREATE TABLE [dbo].[rModelComplect] (
    [Id]                 INT IDENTITY (1, 1) NOT NULL,
    [IdModel]            INT NOT NULL,
    [IdMaterialOriginal] INT NOT NULL,
    [IdStatus]           INT DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialOriginal_rModelComplect_Id] FOREIGN KEY ([IdMaterialOriginal]) REFERENCES [dbo].[rMaterialOriginal] ([Id]),
    CONSTRAINT [FK_rModelDevice_rModelComplect_Id] FOREIGN KEY ([IdModel]) REFERENCES [dbo].[rModelDevice] ([Id])
);

