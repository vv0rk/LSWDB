CREATE TABLE [dbo].[rCompany$] (
    [ Название организации] NVARCHAR (255) NULL,
    [Филиал]                NVARCHAR (255) NULL,
    [Code]                  NVARCHAR (255) NULL,
    [Parent]                NVARCHAR (255) NULL,
    [Код ENG]               NVARCHAR (50)  NULL,
    [id]                    INT            IDENTITY (1, 1) NOT NULL,
    [numPC]                 INT            NULL,
    [Comment]               NVARCHAR (255) NULL,
    [titleNaumen]           NVARCHAR (255) NULL,
    [IdCompanyDogovor]      INT            NULL,
    [IdOU]                  INT            NULL,
    [INN]                   NVARCHAR (30)  NULL,
    [idOUmod]               INT            NULL,
    [isOrg] int not NULL default 1, 
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompany$] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompany$] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompany$] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompany$] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rCompany$] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompany$] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompany$] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompany$] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompany$] TO [IE\UIT_USERS_VR]
    AS [dbo];

