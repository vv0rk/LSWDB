CREATE TABLE [dbo].[htblautomaticclosetickettypes] (
    [autocloseid]  INT NOT NULL,
    [tickettypeid] INT NOT NULL,
    CONSTRAINT [pk_htblautomaticclosetickettypes] PRIMARY KEY CLUSTERED ([autocloseid] ASC, [tickettypeid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblautomaticclosetickettypes_htblautomaticclose] FOREIGN KEY ([autocloseid]) REFERENCES [dbo].[htblautomaticclose] ([autocloseid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblautomaticclosetickettypes_htbltickettypes] FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);

