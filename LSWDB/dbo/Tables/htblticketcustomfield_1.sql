CREATE TABLE [dbo].[htblticketcustomfield] (
    [ticketid]            INT             NOT NULL,
    [fieldid]             INT             NOT NULL,
    [data]                NVARCHAR (4000) NULL,
    [ticketcustomfieldid] INT             IDENTITY (1, 1) NOT NULL,
    [tickettypefieldid]   INT             NULL,
    CONSTRAINT [PK_htblticketcustomfield] PRIMARY KEY CLUSTERED ([ticketcustomfieldid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketcustomfield_htblcustomfields] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[htblcustomfields] ([fieldid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblticketcustomfield_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_fieldid]
    ON [dbo].[htblticketcustomfield]([fieldid] ASC)
    INCLUDE([ticketid], [data]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid_2]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC)
    INCLUDE([ticketcustomfieldid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_tickettypefieldid]
    ON [dbo].[htblticketcustomfield]([tickettypefieldid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid_tickettypefieldid_2]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC, [tickettypefieldid] ASC)
    INCLUDE([data]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid_tickettypefieldid]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC, [tickettypefieldid] ASC)
    INCLUDE([ticketcustomfieldid], [fieldid], [data]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid_fieldid]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC, [fieldid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketcustomfield_ticketid_fieldid_tickettypefieldid]
    ON [dbo].[htblticketcustomfield]([ticketid] ASC, [fieldid] ASC, [tickettypefieldid] ASC) WITH (FILLFACTOR = 90);

