CREATE TABLE [dbo].[htblemailtemplatestickettypes] (
    [templateid]   INT NOT NULL,
    [tickettypeid] INT NOT NULL,
    CONSTRAINT [PK_htblemailtemplatestickettypes] PRIMARY KEY CLUSTERED ([templateid] ASC, [tickettypeid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailtemplatestickettypes_htblemailtemplates] FOREIGN KEY ([templateid]) REFERENCES [dbo].[htblemailtemplates] ([templateid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblemailtemplatestickettypes_htbltickettypes] FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);

