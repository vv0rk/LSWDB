﻿CREATE TABLE [dbo].[htblemailsetup] (
    [timeout]               INT             NOT NULL,
    [historytime]           INT             NOT NULL,
    [historytype]           INT             NOT NULL,
    [rejectunknownid]       BIT             DEFAULT ('0') NULL,
    [addnewclient]          INT             DEFAULT ('1') NULL,
    [accepteddomains]       NVARCHAR (2500) NULL,
    [includegraphics]       BIT             DEFAULT ('1') NULL,
    [clayoutclient]         INT             DEFAULT ('1') NULL,
    [clayoutticket]         INT             DEFAULT ('2') NULL,
    [clayoutnotes]          INT             DEFAULT ('3') NULL,
    [cnotes]                INT             DEFAULT ('-1') NULL,
    [alayoutclient]         INT             DEFAULT ('1') NULL,
    [alayoutticket]         INT             DEFAULT ('2') NULL,
    [alayoutnotes]          INT             DEFAULT ('3') NULL,
    [anotes]                INT             DEFAULT ('-1') NULL,
    [interfacelinks]        BIT             DEFAULT ('0') NULL,
    [actionlinks]           BIT             DEFAULT ('1') NULL,
    [threshold]             INT             DEFAULT ('10') NULL,
    [footer]                TEXT            NULL,
    [emailprefix]           NVARCHAR (50)   DEFAULT ('') NULL,
    [cannotaddclient]       BIT             DEFAULT ((0)) NULL,
    [cannotaddclienttext]   NVARCHAR (1000) DEFAULT ('') NULL,
    [interfacelinkhostname] NVARCHAR (250)  DEFAULT ('') NULL,
    [divider]               NVARCHAR (250)  DEFAULT ('### Everything above this line is added to your ticket ###') NULL,
    [dividerregex]          NVARCHAR (250)  DEFAULT ('\#\#\#\s+everything\s+above\s+this\s+line\s+is\s+added\s+to\s+your\s+ticket\s+\#\#\#') NULL,
    [historycleanup]        DATETIME        DEFAULT (getdate()) NOT NULL,
    [allowkblinks]          BIT             DEFAULT ((0)) NULL,
    [emailstyle]            INT             DEFAULT ((1)) NOT NULL,
    [footertype]            INT             DEFAULT ((1)) NOT NULL
);

