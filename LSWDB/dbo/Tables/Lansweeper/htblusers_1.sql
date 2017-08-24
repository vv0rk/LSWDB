CREATE TABLE [dbo].[htblusers] (
    [userid]          INT             IDENTITY (1, 1) NOT NULL,
    [email]           NVARCHAR (256)  NULL,
    [img]             NVARCHAR (50)   DEFAULT ('') NULL,
    [name]            NVARCHAR (500)  NULL,
    [password]        NVARCHAR (100)  NULL,
    [upn]             NVARCHAR (300)  NULL,
    [username]        NVARCHAR (150)  DEFAULT ('') NULL,
    [userdomain]      NVARCHAR (150)  DEFAULT ('') NULL,
    [metrocolor]      NCHAR (10)      NULL,
    [description]     NVARCHAR (500)  NULL,
    [address]         NVARCHAR (1000) NULL,
    [telephone]       NVARCHAR (500)  NULL,
    [mobile]          NVARCHAR (50)   NULL,
    [fax]             NVARCHAR (50)   NULL,
    [company]         NVARCHAR (100)  NULL,
    [department]      NVARCHAR (500)  NULL,
    [ticketssort]     INT             DEFAULT ((80)) NULL,
    [info]            NVARCHAR (500)  DEFAULT ('') NULL,
    [Roleid]          INT             NULL,
    [firstdayofweek]  TINYINT         NULL,
    [nameLock]        BIT             DEFAULT ((0)) NOT NULL,
    [descriptionLock] BIT             DEFAULT ((0)) NOT NULL,
    [addressLock]     BIT             DEFAULT ((0)) NOT NULL,
    [telephoneLock]   BIT             DEFAULT ((0)) NOT NULL,
    [mobileLock]      BIT             DEFAULT ((0)) NOT NULL,
    [faxLock]         BIT             DEFAULT ((0)) NOT NULL,
    [companyLock]     BIT             DEFAULT ((0)) NOT NULL,
    [departmentLock]  BIT             DEFAULT ((0)) NOT NULL,
    [emailLock]       BIT             DEFAULT ((0)) NOT NULL,
    [language]        INT             DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_htblusers] PRIMARY KEY CLUSTERED ([userid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_htblusers_username_userdomain]
    ON [dbo].[htblusers]([username] ASC, [userdomain] ASC)
    INCLUDE([metrocolor]) WITH (FILLFACTOR = 90);

