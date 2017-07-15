CREATE TABLE [dbo].[rEmployeeMod] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [removed]        BIT             DEFAULT ((0)) NOT NULL,
    [title]          NVARCHAR (4000) NULL,
    [post]           NVARCHAR (255)  NULL,
    [parent_id]      INT             NULL,
    [IdrEmployee]    BIGINT          NOT NULL,
    [idparent_id]    BIGINT          NULL,
    [organisation]   INT             NULL,
    [idorganisation] BIGINT          NULL,
    [Custom1]        NVARCHAR (255)  NULL,
    [Custom2]        NVARCHAR (255)  NULL,
    [Custom3]        NVARCHAR (255)  NULL,
    [Custom4]        NVARCHAR (255)  NULL,
    [Custom19]       NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployeeMod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployeeMod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployeeMod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployeeMod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployeeMod] TO [IE\UIT_USERS_VR]
    AS [dbo];

