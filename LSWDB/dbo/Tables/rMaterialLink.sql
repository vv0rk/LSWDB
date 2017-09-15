CREATE TABLE [dbo].[rMaterialLink] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [IdOriginal] INT NULL,
    [IdAnalog]   INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rMaterialLink_IdOriginal_IdAnalod]
    ON [dbo].[rMaterialLink]([IdOriginal] ASC, [IdAnalog] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialLink] TO [IE\UIT_USERS_VR]
    AS [dbo];

