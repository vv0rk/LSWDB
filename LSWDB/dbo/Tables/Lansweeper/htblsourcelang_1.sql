CREATE TABLE [dbo].[htblsourcelang] (
    [sourceid]    INT            NOT NULL,
    [language]    INT            NOT NULL,
    [name]        NVARCHAR (100) NULL,
    [description] NVARCHAR (200) NULL,
    CONSTRAINT [PK_htblsourcelang] PRIMARY KEY CLUSTERED ([sourceid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblsourcelang_htblsourcelang] FOREIGN KEY ([sourceid], [language]) REFERENCES [dbo].[htblsourcelang] ([sourceid], [language])
);

