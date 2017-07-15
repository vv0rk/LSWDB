CREATE TABLE [dbo].[rImport] (
    [AssetId]   FLOAT (53)     NULL,
    [Custom1]   NVARCHAR (255) NULL,
    [Custom2]   NVARCHAR (255) NULL,
    [Custom3]   NVARCHAR (255) NULL,
    [Custom4]   FLOAT (53)     NULL,
    [Custom5]   NVARCHAR (255) NULL,
    [SerialNum] NVARCHAR (255) NULL,
    [Custom7]   NVARCHAR (255) NULL,
    [AssetName] NVARCHAR (255) NULL,
    [Custom6]   NVARCHAR (255) NULL,
    [Custom11]  NVARCHAR (255) NULL,
    [Custom19]  NVARCHAR (255) NULL,
    [Custom13]  NVARCHAR (255) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rImport] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rImport] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rImport] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rImport] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rImport] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rImport] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rImport] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rImport] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rImport] TO [IE\UIT_USERS_VR]
    AS [dbo];

