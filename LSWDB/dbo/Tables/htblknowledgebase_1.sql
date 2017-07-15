CREATE TABLE [dbo].[htblknowledgebase] (
    [kbid]          INT            IDENTITY (1, 1) NOT NULL,
    [attachementid] INT            NULL,
    [name]          NVARCHAR (500) NULL,
    [type]          NVARCHAR (50)  NULL,
    [categoryid]    INT            NOT NULL,
    [sortorder]     INT            NOT NULL,
    [added]         DATETIME       DEFAULT (getdate()) NULL,
    [message]       NTEXT          NULL,
    [createdby]     INT            NULL,
    [alteredby]     INT            NULL,
    [altered]       DATETIME       CONSTRAINT [DF_htblknowledgebase_altered] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_htblknowledgebase] PRIMARY KEY CLUSTERED ([kbid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblknowledgebase_htblknowledgebasecategories] FOREIGN KEY ([categoryid]) REFERENCES [dbo].[htblknowledgebasecategories] ([categoryid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htblknowledgebase_htblknowledgebasecategories]
    ON [dbo].[htblknowledgebase]([categoryid] ASC) WITH (FILLFACTOR = 90);

