CREATE TABLE [dbo].[tsysWebUsers] (
    [PageID]        INT            IDENTITY (1, 1) NOT NULL,
    [Username]      NVARCHAR (150) NOT NULL,
    [DateFormat]    VARCHAR (20)   NULL,
    [sortascending] BIT            DEFAULT ((1)) NULL,
    [language]      INT            DEFAULT ((1)) NOT NULL,
    [searchnewtab]  BIT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_tsysWebUsers] PRIMARY KEY CLUSTERED ([PageID] ASC) WITH (FILLFACTOR = 90)
);

