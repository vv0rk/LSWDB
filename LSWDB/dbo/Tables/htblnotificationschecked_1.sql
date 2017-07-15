CREATE TABLE [dbo].[htblnotificationschecked] (
    [checkid] INT IDENTITY (1, 1) NOT NULL,
    [userid]  INT NOT NULL,
    [histid]  INT NOT NULL,
    CONSTRAINT [PK_htblnotificationschecked] PRIMARY KEY CLUSTERED ([checkid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([histid]) REFERENCES [dbo].[htblhistory] ([histid]) ON DELETE CASCADE,
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotificationschecked_userid]
    ON [dbo].[htblnotificationschecked]([userid] ASC, [histid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotificationschecked_htblhistory]
    ON [dbo].[htblnotificationschecked]([histid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotificationschecked_htblusers]
    ON [dbo].[htblnotificationschecked]([userid] ASC) WITH (FILLFACTOR = 90);

