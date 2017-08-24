CREATE TABLE [dbo].[htblautomaticcloseLang] (
    [autocloseid] INT   NOT NULL,
    [language]    INT   NOT NULL,
    [message1]    NTEXT NULL,
    [message2]    NTEXT NULL,
    CONSTRAINT [PK_htblautomaticcloseLang] PRIMARY KEY CLUSTERED ([autocloseid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblautomaticcloseLang_htblautomaticclose] FOREIGN KEY ([autocloseid]) REFERENCES [dbo].[htblautomaticclose] ([autocloseid]) ON DELETE CASCADE
);

