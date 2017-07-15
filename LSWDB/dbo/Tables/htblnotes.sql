CREATE TABLE [dbo].[htblnotes] (
    [noteid]           INT             IDENTITY (1, 1) NOT NULL,
    [ticketid]         INT             NULL,
    [userid]           INT             NULL,
    [date]             DATETIME        DEFAULT (getdate()) NOT NULL,
    [note]             NTEXT           NULL,
    [notetype]         INT             NULL,
    [emailmessageid]   NVARCHAR (1024) NULL,
    [servicechange]    BIT             DEFAULT ((0)) NULL,
    [timeworkeduserid] INT             NULL,
    [timeworkeddate]   DATETIME        NULL,
    [timeworked]       INT             NULL,
    CONSTRAINT [PK_htblnotes] PRIMARY KEY CLUSTERED ([noteid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblnotes_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblnotes_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotes_notetype]
    ON [dbo].[htblnotes]([notetype] ASC)
    INCLUDE([ticketid], [userid], [date]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotes_userid_notetype]
    ON [dbo].[htblnotes]([userid] ASC, [notetype] ASC)
    INCLUDE([ticketid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotes_notetype_2]
    ON [dbo].[htblnotes]([notetype] ASC)
    INCLUDE([ticketid], [userid]) WITH (FILLFACTOR = 90);

