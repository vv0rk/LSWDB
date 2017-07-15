CREATE TABLE [dbo].[htbltickettypesLang] (
    [tickettypeid] INT           NOT NULL,
    [language]     INT           NOT NULL,
    [typename]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_htbltickettypesLang] PRIMARY KEY CLUSTERED ([tickettypeid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbltickettypesLang_htbltickettypes] FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);

