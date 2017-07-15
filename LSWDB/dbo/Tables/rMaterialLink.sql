CREATE TABLE [dbo].[rMaterialLink] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [IdOriginal] INT NOT NULL,
    [IdAnalog]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialAnalog_rMaterialLink_Id] FOREIGN KEY ([IdAnalog]) REFERENCES [dbo].[rMaterialAnalog] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rMaterialLink_IdOriginal_IdAnalod]
    ON [dbo].[rMaterialLink]([IdOriginal] ASC, [IdAnalog] ASC) WITH (FILLFACTOR = 90);

