CREATE TABLE [dbo].[rSclad1CSprav] (
    [Id]           INT IDENTITY (1, 1) NOT NULL,
    [IdSclad]      INT NOT NULL,
    [Id1CSprav]    INT NOT NULL,
    [Number]       INT NULL,
    [NumberInvent] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_rSclad1CSprav] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id]),
    CONSTRAINT [FK_rSclad1CSprav_r1CSprav_Id1CSprav] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rSclad1CSprav_IdSclad_Id1CSprav]
    ON [dbo].[rSclad1CSprav]([IdSclad] ASC, [Id1CSprav] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rSclad1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rSclad1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rSclad1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];

