CREATE TABLE [dbo].[htblemailaccountsLang] (
    [accountid]   INT            NOT NULL,
    [language]    INT            NOT NULL,
    [displayname] NVARCHAR (250) NULL,
    CONSTRAINT [PK_htblemailaccountsLang] PRIMARY KEY CLUSTERED ([accountid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailaccountsLang_htblemailaccounts] FOREIGN KEY ([accountid]) REFERENCES [dbo].[htblemailaccounts] ([accountid]) ON DELETE CASCADE
);

