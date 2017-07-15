CREATE TABLE [dbo].[htblspecialrulesactions] (
    [actionid] INT IDENTITY (1, 1) NOT NULL,
    [ruleid]   INT NOT NULL,
    [type]     INT NOT NULL,
    [typeid]   INT NOT NULL,
    CONSTRAINT [PK_htblspecialrulesactions] PRIMARY KEY CLUSTERED ([actionid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblspecialrulesactions_htblspecialrules] FOREIGN KEY ([ruleid]) REFERENCES [dbo].[htblspecialrules] ([ruleid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblspecialrulesactions_htblspecialrules]
    ON [dbo].[htblspecialrulesactions]([ruleid] ASC) WITH (FILLFACTOR = 90);

