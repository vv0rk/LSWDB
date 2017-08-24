CREATE TABLE [dbo].[htblticketsubscribers] (
    [subscriberid] INT IDENTITY (1, 1) NOT NULL,
    [ticketid]     INT NULL,
    [agentid]      INT NOT NULL,
    [type]         INT DEFAULT ((3)) NULL,
    CONSTRAINT [PK_htblticketsubscribers] PRIMARY KEY CLUSTERED ([subscriberid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE,
    FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketsubscribers_htblagents]
    ON [dbo].[htblticketsubscribers]([agentid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketsubscribers_htblticket]
    ON [dbo].[htblticketsubscribers]([ticketid] ASC) WITH (FILLFACTOR = 90);

