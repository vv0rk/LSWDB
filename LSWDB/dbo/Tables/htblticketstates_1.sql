CREATE TABLE [dbo].[htblticketstates] (
    [ticketstateid] INT            NOT NULL,
    [statename]     NVARCHAR (50)  NULL,
    [color]         NCHAR (10)     NULL,
    [description]   NVARCHAR (100) NULL,
    [default]       BIT            DEFAULT ((0)) NULL,
    [trackaswork]   BIT            DEFAULT ((0)) NULL,
    [sortorder]     INT            DEFAULT ((1)) NULL,
    [clientreplies] BIT            DEFAULT ((0)) NULL,
    [taskstate]     BIT            DEFAULT ((0)) NULL,
    [replacementid] INT            DEFAULT (NULL) NULL,
    CONSTRAINT [PK_htblticketstates] PRIMARY KEY CLUSTERED ([ticketstateid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([replacementid]) REFERENCES [dbo].[htblticketstates] ([ticketstateid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketstates_htblticketstates]
    ON [dbo].[htblticketstates]([replacementid] ASC) WITH (FILLFACTOR = 90);

