CREATE TABLE [dbo].[TsysCustomLayout] (
    [loginlogo]            NVARCHAR (50)  DEFAULT ('logo.png') NULL,
    [loginheaderheight]    INT            DEFAULT ((38)) NOT NULL,
    [loginheaderimg]       NVARCHAR (50)  DEFAULT ('bar1.png') NULL,
    [loginheadercolor]     NVARCHAR (10)  DEFAULT ('') NULL,
    [loginfootertext]      NVARCHAR (200) DEFAULT ('Copyright www.lansweeper.com') NULL,
    [loginfootertextcolor] NVARCHAR (10)  DEFAULT ('#ffffff') NULL,
    [loginfooterheight]    INT            DEFAULT ((35)) NOT NULL,
    [loginfooterimg]       NVARCHAR (50)  DEFAULT ('bar1.png') NULL,
    [loginfootercolor]     NVARCHAR (10)  DEFAULT ('') NULL,
    [logintitle]           NVARCHAR (200) DEFAULT ('Lansweeper login') NULL,
    [loginmessage]         NTEXT          DEFAULT ('') NULL,
    [loginmessagecolor]    NVARCHAR (10)  DEFAULT ('#000000') NULL,
    [loginmessageposition] INT            DEFAULT ((1)) NULL,
    [showloginmessage]     BIT            NULL,
    [showloginheader]      BIT            NULL,
    [showloginfooter]      BIT            NULL
);

