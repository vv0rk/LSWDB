CREATE TABLE [dbo].[htblscheduletypesLang] (
    [typeid]   INT            NOT NULL,
    [language] INT            NOT NULL,
    [name]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_htblscheduletypesLang] PRIMARY KEY CLUSTERED ([typeid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblscheduletypesLang_htblscheduletypes] FOREIGN KEY ([typeid]) REFERENCES [dbo].[htblscheduletypes] ([typeid]) ON DELETE CASCADE
);

