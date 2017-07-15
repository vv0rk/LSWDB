CREATE TABLE [dbo].[rAudit] (
    [Type]       CHAR (1)        NULL,
    [TableName]  NVARCHAR (128)  NULL,
    [PK]         NVARCHAR (1000) NULL,
    [FieldName]  NVARCHAR (128)  NULL,
    [OldValue]   NVARCHAR (1000) NULL,
    [NewValue]   NVARCHAR (1000) NULL,
    [UpdateDate] DATETIME        NULL,
    [UserName]   NVARCHAR (128)  NULL
);


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAudit] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAudit] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAudit] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAudit] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAudit] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAudit] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAudit] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAudit] TO [IE\UIT_USERS_VR]
    AS [dbo];

