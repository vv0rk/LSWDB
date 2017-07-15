CREATE TABLE [dbo].[rScladMaterialAnalog] (
    [Id]               INT IDENTITY (1, 1) NOT NULL,
    [IdSclad]          INT NOT NULL,
    [IdMaterialAnalog] INT NOT NULL,
    [Number]           INT NULL,
    [NumberInv]        INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_rScladMaterialAnalog] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id]),
    CONSTRAINT [FK_rScladMaterialAnalog_rMaterialAnalog_IdMaterialAnalog] FOREIGN KEY ([IdMaterialAnalog]) REFERENCES [dbo].[rMaterialAnalog] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rScladMaterialAnalog_IdSclad_IdMaterialAnalog]
    ON [dbo].[rScladMaterialAnalog]([IdSclad] ASC, [IdMaterialAnalog] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rScladMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];

