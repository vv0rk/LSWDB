CREATE TABLE [dbo].[htblknowledgebasecategoriesteams] (
    [linkid]     INT IDENTITY (1, 1) NOT NULL,
    [categoryid] INT NOT NULL,
    [teamid]     INT NOT NULL,
    [editaccess] BIT NULL,
    CONSTRAINT [PK_htblknowledgebasecategoriesteams] PRIMARY KEY CLUSTERED ([linkid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblknowledgebasecategoriesteams_htblknowledgebasecategories] FOREIGN KEY ([categoryid]) REFERENCES [dbo].[htblknowledgebasecategories] ([categoryid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblknowledgebasecategoriesteams_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblknowledgebasecategoriesteams_htblknowledgebasecategories]
    ON [dbo].[htblknowledgebasecategoriesteams]([categoryid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblknowledgebasecategoriesteams_htblteams]
    ON [dbo].[htblknowledgebasecategoriesteams]([teamid] ASC) WITH (FILLFACTOR = 90);

