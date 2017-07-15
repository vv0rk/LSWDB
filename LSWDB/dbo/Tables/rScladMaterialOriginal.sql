CREATE TABLE [dbo].[rScladMaterialOriginal] (
    [Id]                 INT IDENTITY (1, 1) NOT NULL,
    [IdSclad]            INT NOT NULL,
    [IdMaterialOriginal] INT NOT NULL,
    [Number]             INT NULL,
    [NumberC]            INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_rScladMaterialOriginal_rMaterialOriginal_IdMaterialOriginal] FOREIGN KEY ([IdMaterialOriginal]) REFERENCES [dbo].[rMaterialOriginal] ([Id]),
    CONSTRAINT [FK_rScladMaterialOriginal_rSclad_IdSclad] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rScladMaterialOriginal_IdSclad_IdMaterialOriginal]
    ON [dbo].[rScladMaterialOriginal]([IdSclad] ASC, [IdMaterialOriginal] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

