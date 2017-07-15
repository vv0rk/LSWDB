CREATE TABLE [dbo].[htbloldticketdata] (
    [oldid]       INT            IDENTITY (1, 1) NOT NULL,
    [ticketid]    INT            NOT NULL,
    [subject]     NVARCHAR (500) NULL,
    [description] NTEXT          NULL,
    [changed]     DATETIME       DEFAULT (getdate()) NULL,
    [userid]      INT            NULL,
    CONSTRAINT [PK_htbloldticketdata] PRIMARY KEY CLUSTERED ([oldid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbloldticketdata_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htbloldticketdata_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htbloldticketdata_htblticket]
    ON [dbo].[htbloldticketdata]([ticketid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htbloldticketdata_htblusers]
    ON [dbo].[htbloldticketdata]([userid] ASC) WITH (FILLFACTOR = 90);

