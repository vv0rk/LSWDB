CREATE TABLE [dbo].[htblslatickettypes] (
    [slaid]        INT NOT NULL,
    [tickettypeid] INT NOT NULL,
    CONSTRAINT [pk_htblslatickettypes] PRIMARY KEY CLUSTERED ([slaid] ASC, [tickettypeid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE,
    FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);

