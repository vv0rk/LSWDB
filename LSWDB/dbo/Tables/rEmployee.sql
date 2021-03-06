﻿CREATE TABLE [dbo].[rEmployee] (
    [id]                        BIGINT          NOT NULL,
    [creation_date]             DATETIME2 (7)   NOT NULL,
    [last_modified_date]        DATETIME2 (7)   NULL,
    [removal_date]              DATETIME2 (7)   NULL,
    [removed]                   BIT             NOT NULL,
    [title]                     NVARCHAR (4000) NULL,
    [case_id]                   NVARCHAR (255)  NOT NULL,
    [city_phone]                NVARCHAR (255)  NULL,
    [date_of_birth]             DATETIME2 (7)   NULL,
    [email]                     NVARCHAR (255)  NULL,
    [first_name]                NVARCHAR (255)  NULL,
    [home_phone]                NVARCHAR (255)  NULL,
    [internal_phone]            NVARCHAR (255)  NULL,
    [last_name]                 NVARCHAR (255)  NOT NULL,
    [login]                     NVARCHAR (255)  NULL,
    [middle_name]               NVARCHAR (255)  NULL,
    [mobile_phone]              NVARCHAR (255)  NULL,
    [num_]                      BIGINT          NULL,
    [password]                  NVARCHAR (255)  NULL,
    [post]                      NVARCHAR (255)  NULL,
    [private_code]              NVARCHAR (255)  NULL,
    [author_id]                 BIGINT          NULL,
    [system_icon_id]            BIGINT          NULL,
    [parent_id]                 BIGINT          NULL,
    [idHolder]                  NVARCHAR (255)  NULL,
    [icon]                      BIGINT          NULL,
    [employee$intro]            NVARCHAR (MAX)  NULL,
    [employee$shortDescr1]      NVARCHAR (MAX)  NULL,
    [employee$keyEmployee]      BIT             NULL,
    [employee$shortDescr2]      NVARCHAR (MAX)  NULL,
    [employee$quickStart]       NVARCHAR (MAX)  NULL,
    [employee$shortDescr3]      NVARCHAR (MAX)  NULL,
    [employee$processDocumen]   NVARCHAR (MAX)  NULL,
    [employee$cs]               NVARCHAR (MAX)  NULL,
    [employee$workMng]          NVARCHAR (MAX)  NULL,
    [contactPerson$keyEmployee] BIT             NULL,
    [objectGUID]                NVARCHAR (255)  NULL,
    [organization]              BIGINT          NULL,
    [address]                   NVARCHAR (255)  NULL,
    [VIP]                       BIGINT          NULL,
    [is_employee_locked]        BIT             NULL,
    [password_change_date]      DATETIME2 (7)   NULL,
    [password_must_be_changed]  BIT             NULL,
    [isRemoved]                 BIT             NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployee] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployee] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployee] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployee] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployee] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployee] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployee] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployee] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rEmployee] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rEmployee] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rEmployee] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rEmployee] TO [IE\UIT_USERS_VR]
    AS [dbo];

