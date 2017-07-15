CREATE TABLE [dbo].[htblspecialrulesconditions] (
    [conditionid] INT            IDENTITY (1, 1) NOT NULL,
    [ruleid]      INT            NOT NULL,
    [type]        INT            NOT NULL,
    [condition]   INT            NOT NULL,
    [text]        NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_htblspecialrulesconditions] PRIMARY KEY CLUSTERED ([conditionid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblspecialrulesconditions_htblspecialrules] FOREIGN KEY ([ruleid]) REFERENCES [dbo].[htblspecialrules] ([ruleid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblspecialrulesconditions_htblspecialrules]
    ON [dbo].[htblspecialrulesconditions]([ruleid] ASC) WITH (FILLFACTOR = 90);

