CREATE TABLE [dbo].[htblnotehistory] (
    [notehistoryid] INT      IDENTITY (1, 1) NOT NULL,
    [noteid]        INT      NOT NULL,
    [note]          NTEXT    NULL,
    [userid]        INT      NOT NULL,
    [date]          DATETIME DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_htblnotehistory] PRIMARY KEY CLUSTERED ([notehistoryid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([noteid]) REFERENCES [dbo].[htblnotes] ([noteid]) ON DELETE CASCADE,
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotehistory_htblnotes]
    ON [dbo].[htblnotehistory]([noteid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblnotehistory_htblusers]
    ON [dbo].[htblnotehistory]([userid] ASC) WITH (FILLFACTOR = 90);

