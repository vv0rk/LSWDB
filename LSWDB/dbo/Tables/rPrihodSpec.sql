CREATE TABLE [dbo].[rPrihodSpec] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [IdPrihod]  INT NOT NULL,
    [Id1CSprav] INT NOT NULL,
    [Nr]        INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rPrihodSpec_r1CSprav_Id] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id]),
    CONSTRAINT [FK_rPrihodSpec_rPrihod_Id] FOREIGN KEY ([IdPrihod]) REFERENCES [dbo].[rPrihod] ([Id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rPrihodSpec] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rPrihodSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rPrihodSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rPrihodSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rPrihodSpec] TO [IE\UIT_USERS_VR]
    AS [dbo];

