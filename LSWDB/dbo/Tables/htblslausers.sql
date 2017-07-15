CREATE TABLE [dbo].[htblslausers] (
    [slaid]  INT NOT NULL,
    [userid] INT NOT NULL,
    CONSTRAINT [pk_htblslausers] PRIMARY KEY CLUSTERED ([slaid] ASC, [userid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE,
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);

