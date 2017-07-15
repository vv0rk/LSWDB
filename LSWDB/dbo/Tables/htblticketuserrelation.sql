CREATE TABLE [dbo].[htblticketuserrelation] (
    [ticketuserrelationid] INT      IDENTITY (1, 1) NOT NULL,
    [ticketid]             INT      NOT NULL,
    [userid]               INT      NOT NULL,
    [type]                 INT      NOT NULL,
    [date]                 DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_htblticketuserrelation] PRIMARY KEY CLUSTERED ([ticketuserrelationid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE,
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketuserrelation_htblticket]
    ON [dbo].[htblticketuserrelation]([ticketid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketuserrelation_htblusers]
    ON [dbo].[htblticketuserrelation]([userid] ASC) WITH (FILLFACTOR = 90);

