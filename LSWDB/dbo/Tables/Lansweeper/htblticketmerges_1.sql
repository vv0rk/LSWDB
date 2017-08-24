CREATE TABLE [dbo].[htblticketmerges] (
    [mergeid] INT      IDENTITY (1, 1) NOT NULL,
    [oldtid]  INT      NOT NULL,
    [newtid]  INT      NOT NULL,
    [date]    DATETIME CONSTRAINT [DF_htblticketmerges_date] DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([mergeid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketmerges_htblticket] FOREIGN KEY ([newtid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketmerges_htblticket]
    ON [dbo].[htblticketmerges]([newtid] ASC) WITH (FILLFACTOR = 90);

