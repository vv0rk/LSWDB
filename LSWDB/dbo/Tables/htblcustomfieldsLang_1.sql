CREATE TABLE [dbo].[htblcustomfieldsLang] (
    [fieldid]   INT            NOT NULL,
    [language]  INT            NOT NULL,
    [name]      NVARCHAR (500) NULL,
    [labeltext] NVARCHAR (500) NULL,
    CONSTRAINT [PK_htblcustomfieldsLang] PRIMARY KEY CLUSTERED ([fieldid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblcustomfieldsLang_htblcustomfields] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[htblcustomfields] ([fieldid]) ON DELETE CASCADE
);

