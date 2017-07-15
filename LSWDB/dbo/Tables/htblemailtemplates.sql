CREATE TABLE [dbo].[htblemailtemplates] (
    [templateid]     INT            NOT NULL,
    [name]           NVARCHAR (100) DEFAULT ('New E-mail template') NULL,
    [text]           NTEXT          NULL,
    [outgoing]       BIT            NOT NULL,
    [replytype]      INT            DEFAULT ((1)) NULL,
    [addnotehistory] BIT            DEFAULT ((0)) NULL,
    [subject]        NVARCHAR (250) NULL,
    [enabled]        BIT            NULL,
    CONSTRAINT [PK_htblemailtemplates] PRIMARY KEY CLUSTERED ([templateid] ASC) WITH (FILLFACTOR = 90)
);

