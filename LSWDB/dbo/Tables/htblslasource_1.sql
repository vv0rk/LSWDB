CREATE TABLE [dbo].[htblslasource] (
    [slaid]    INT NOT NULL,
    [sourceid] INT NOT NULL,
    CONSTRAINT [pk_htlbslasource] PRIMARY KEY CLUSTERED ([slaid] ASC, [sourceid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE,
    FOREIGN KEY ([sourceid]) REFERENCES [dbo].[htblsource] ([sourceid]) ON DELETE CASCADE
);

