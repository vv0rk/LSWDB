CREATE TABLE [dbo].[htblschedule] (
    [scheduleid]  INT             IDENTITY (1, 1) NOT NULL,
    [ticketid]    INT             NULL,
    [date]        DATETIME        NULL,
    [enddate]     DATETIME        NULL,
    [title]       NVARCHAR (150)  NULL,
    [description] NVARCHAR (4000) NULL,
    [status]      INT             NULL,
    [typeid]      INT             NULL,
    [allday]      BIT             NULL,
    [public]      BIT             NULL,
    [showtoteam]  BIT             DEFAULT ((0)) NULL,
    [createdby]   INT             NULL,
    [alteredby]   INT             NULL,
    [reminder]    INT             DEFAULT ((-1)) NULL,
    [deleted]     BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblschedule] PRIMARY KEY CLUSTERED ([scheduleid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblschedule_htblagents] FOREIGN KEY ([createdby]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblschedule_htblscheduletypes] FOREIGN KEY ([typeid]) REFERENCES [dbo].[htblscheduletypes] ([typeid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblschedule_htblagents]
    ON [dbo].[htblschedule]([createdby] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblschedule_htblscheduletypes]
    ON [dbo].[htblschedule]([typeid] ASC) WITH (FILLFACTOR = 90);

