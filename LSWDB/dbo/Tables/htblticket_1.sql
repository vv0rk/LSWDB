CREATE TABLE [dbo].[htblticket] (
    [ticketid]         INT            IDENTITY (1, 1) NOT NULL,
    [subject]          NVARCHAR (500) NOT NULL,
    [replysubject]     NVARCHAR (500) NULL,
    [date]             DATETIME       DEFAULT (getdate()) NOT NULL,
    [priority]         INT            NULL,
    [ticketstateid]    INT            NULL,
    [fromuserid]       INT            NULL,
    [agentid]          INT            NULL,
    [tickettypeid]     INT            NULL,
    [deadline]         DATETIME       NULL,
    [sourceid]         INT            NULL,
    [updated]          DATETIME       DEFAULT (getdate()) NOT NULL,
    [flagged]          BIT            DEFAULT ((0)) NULL,
    [accountid]        INT            NULL,
    [replyaddress]     NVARCHAR (256) NULL,
    [servicechange]    BIT            DEFAULT ((1)) NULL,
    [websitechange]    BIT            NULL,
    [extradata]        NVARCHAR (250) NULL,
    [clientconcerning] INT            NULL,
    [spam]             BIT            DEFAULT ((0)) NULL,
    [assetid]          INT            DEFAULT ((0)) NULL,
    [agentinitiated]   BIT            DEFAULT ((0)) NULL,
    [alias]            NVARCHAR (256) NULL,
    [slaname]          NVARCHAR (75)  DEFAULT ('') NULL,
    [slainitial]       DATETIME       NULL,
    [slaresolved]      DATETIME       NULL,
    [resolvecalc]      BIT            DEFAULT ((0)) NULL,
    [slabusiness]      BIT            DEFAULT ((0)) NULL,
    [flaggeddate]      DATETIME       DEFAULT ('1900-01-01 00:00:00.000') NULL,
    [autoclose]        INT            DEFAULT ((0)) NULL,
    [duplicateid]      INT            NULL,
    [ispersonal]       BIT            DEFAULT ((0)) NOT NULL,
    [histid]           INT            NULL,
    [userid_lastnote]  INT            NULL,
    [ipaddress]        NVARCHAR (100) NULL,
    [lastuserreply]    DATETIME       CONSTRAINT [DF_htblticket_lastuserreply] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_htblticket] PRIMARY KEY CLUSTERED ([ticketid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticket_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]),
    CONSTRAINT [FK_htblticket_htblpriorities] FOREIGN KEY ([priority]) REFERENCES [dbo].[htblpriorities] ([priority]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblticket_htblticketstates] FOREIGN KEY ([ticketstateid]) REFERENCES [dbo].[htblticketstates] ([ticketstateid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblticket_htblusers] FOREIGN KEY ([fromuserid]) REFERENCES [dbo].[htblusers] ([userid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_ticketid]
    ON [dbo].[htblticket]([ticketid] ASC, [spam] ASC, [fromuserid] ASC, [agentid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_histid]
    ON [dbo].[htblticket]([histid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_tickettypeid_sourceid_ticketid]
    ON [dbo].[htblticket]([tickettypeid] ASC, [sourceid] ASC, [ticketid] ASC)
    INCLUDE([spam]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_date_ticketstateid_spam_flaggeddate_2]
    ON [dbo].[htblticket]([flagged] ASC, [date] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([ticketid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_ticketid_ticketstateid_spam_flaggeddate_2]
    ON [dbo].[htblticket]([flagged] ASC, [ticketid] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_date_ticketstateid_spam_flaggeddate]
    ON [dbo].[htblticket]([flagged] ASC, [date] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([ticketid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_ticketid_ticketstateid_spam_flaggeddate]
    ON [dbo].[htblticket]([flagged] ASC, [ticketid] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_date_spam]
    ON [dbo].[htblticket]([date] ASC, [spam] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_ticketstateid_date_spam_3]
    ON [dbo].[htblticket]([ticketstateid] ASC, [date] ASC, [spam] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_date_ticketstateid_spam]
    ON [dbo].[htblticket]([date] ASC, [ticketstateid] ASC, [spam] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid], [slaname], [slainitial], [slaresolved], [resolvecalc]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_ticketstateid_date_spam_2]
    ON [dbo].[htblticket]([ticketstateid] ASC, [date] ASC, [spam] ASC)
    INCLUDE([ticketid], [subject], [fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_tickettypeid_2]
    ON [dbo].[htblticket]([tickettypeid] ASC)
    INCLUDE([date]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_ticketstateid_date_spam]
    ON [dbo].[htblticket]([ticketstateid] ASC, [date] ASC, [spam] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid], [slaname], [slainitial], [slaresolved], [resolvecalc]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_date]
    ON [dbo].[htblticket]([date] ASC)
    INCLUDE([ticketid], [tickettypeid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_tickettypeid]
    ON [dbo].[htblticket]([tickettypeid] ASC)
    INCLUDE([ticketid], [date]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_ticketstateid_spam]
    ON [dbo].[htblticket]([ticketstateid] ASC, [spam] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid], [tickettypeid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_flagged_date_ticketstateid_spam]
    ON [dbo].[htblticket]([agentid] ASC, [flagged] ASC, [date] ASC, [ticketstateid] ASC, [spam] ASC)
    INCLUDE([ticketid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_flagged_date_ticketstateid_spam_flaggeddate]
    ON [dbo].[htblticket]([agentid] ASC, [flagged] ASC, [date] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([ticketid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_flagged_ticketid_ticketstateid_spam]
    ON [dbo].[htblticket]([agentid] ASC, [flagged] ASC, [ticketid] ASC, [ticketstateid] ASC, [spam] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_date_spam_flaggeddate]
    ON [dbo].[htblticket]([flagged] ASC, [date] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([ticketid], [fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_ticketstateid]
    ON [dbo].[htblticket]([agentid] ASC, [ticketstateid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_ticketid_spam]
    ON [dbo].[htblticket]([flagged] ASC, [ticketid] ASC, [spam] ASC)
    INCLUDE([fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_ticketid_spam_flaggeddate]
    ON [dbo].[htblticket]([flagged] ASC, [ticketid] ASC, [spam] ASC, [flaggeddate] ASC)
    INCLUDE([fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_flagged_ticketid_ticketstateid_spam_flaggeddate]
    ON [dbo].[htblticket]([agentid] ASC, [flagged] ASC, [ticketid] ASC, [ticketstateid] ASC, [spam] ASC, [flaggeddate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_flagged_ticketid_tickettypeid_spam]
    ON [dbo].[htblticket]([flagged] ASC, [ticketid] ASC, [tickettypeid] ASC, [spam] ASC)
    INCLUDE([fromuserid], [agentid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_ticketstateid_spam]
    ON [dbo].[htblticket]([agentid] ASC, [ticketstateid] ASC, [spam] ASC)
    INCLUDE([ticketid], [subject], [date], [priority], [tickettypeid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblticket_agentid_tickettypeid]
    ON [dbo].[htblticket]([agentid] ASC, [tickettypeid] ASC)
    INCLUDE([ticketid], [subject], [date], [priority], [ticketstateid], [spam]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_htblticket_8_1513824505__K5_K1_K7_K6_2]
    ON [dbo].[htblticket]([ticketstateid] ASC, [ticketid] ASC, [agentid] ASC, [fromuserid] ASC)
    INCLUDE([subject]) WITH (FILLFACTOR = 90);

