CREATE TABLE [dbo].[htbllook] (
    [name]             NVARCHAR (100) DEFAULT ('Lansweeper Helpdesk') NULL,
    [singlebg]         BIT            DEFAULT ('1') NULL,
    [colorbg]          NCHAR (10)     DEFAULT ('#535353') NULL,
    [colorgradient1]   NCHAR (10)     DEFAULT ('#535353') NULL,
    [colorgradient2]   NCHAR (10)     DEFAULT ('#1B1B1B') NULL,
    [colortext]        NCHAR (10)     DEFAULT ('#ffffff') NULL,
    [font]             NVARCHAR (50)  DEFAULT ('Arial') NULL,
    [tabcolor]         NCHAR (10)     DEFAULT ('#E2EBF4') NULL,
    [tabtext]          NCHAR (10)     DEFAULT ('#0084B4') NULL,
    [selectedtabcolor] NCHAR (10)     DEFAULT ('#ffffff') NULL,
    [selectedtabtext]  NCHAR (10)     DEFAULT ('#0084B4') NULL,
    [showname]         BIT            DEFAULT ((1)) NULL,
    [nameshadow]       BIT            DEFAULT ((1)) NULL,
    [customheader]     BIT            DEFAULT ((0)) NULL
);

