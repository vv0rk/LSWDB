CREATE TABLE [dbo].[tsysCustomNames] (
    [Customname]  VARCHAR (50)    NOT NULL,
    [Displayname] NVARCHAR (100)  NOT NULL,
    [Type]        TINYINT         NULL,
    [Values]      NVARCHAR (4000) NULL,
    [Info]        NVARCHAR (250)  NULL,
    CONSTRAINT [PK_tsysCustomNames] PRIMARY KEY CLUSTERED ([Customname] ASC) WITH (FILLFACTOR = 90)
);

