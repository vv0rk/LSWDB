CREATE TABLE [dbo].[rTemporary] (
    [Custom20] NVARCHAR (255) NULL,
    [Date1]    DATE           NULL,
    [Date2]    DATE           NULL,
    [text1]    NVARCHAR (255) NULL,
    [text2]    NVARCHAR (255) NULL,
    [text3]    NVARCHAR (255) NULL,
    [text4]    NVARCHAR (255) NULL,
    [num1]     INT            NULL,
    [ind1]     INT            NULL,
    [ind2]     INT            NULL,
    [text5]    NVARCHAR (255) NULL,
    [text6]    NVARCHAR (255) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTemporary] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTemporary] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTemporary] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTemporary] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTemporary] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTemporary] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTemporary] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTemporary] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTemporary] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTemporary] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTemporary] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTemporary] TO [IE\UIT_USERS_VR]
    AS [dbo];

