CREATE TABLE [dbo].[htblhistory] (
    [histid]        INT            IDENTITY (1, 1) NOT NULL,
    [action]        NVARCHAR (150) NULL,
    [userid]        INT            NULL,
    [ticketid]      INT            NULL,
    [date]          DATETIME       DEFAULT (getdate()) NULL,
    [typeid]        INT            NOT NULL,
    [status]        INT            DEFAULT ((0)) NULL,
    [reason]        NVARCHAR (100) NULL,
    [ticketstateid] INT            DEFAULT (NULL) NULL,
    [tickettypeid]  INT            DEFAULT (NULL) NULL,
    [priority]      INT            DEFAULT (NULL) NULL,
    [teamid]        INT            DEFAULT (NULL) NULL,
    [agentid]       INT            DEFAULT (NULL) NULL,
    [assetid]       INT            DEFAULT (NULL) NULL,
    [scheduleid]    INT            DEFAULT (NULL) NULL,
    [noteid]        INT            DEFAULT (NULL) NULL,
    [fieldid]       INT            DEFAULT (NULL) NULL,
    [ruleid]        INT            DEFAULT (NULL) NULL,
    [userid2]       INT            DEFAULT (NULL) NULL,
    [userid3]       INT            DEFAULT (NULL) NULL,
    [agentid2]      INT            DEFAULT (NULL) NULL,
    [type]          INT            DEFAULT (NULL) NULL,
    [unauthorised]  BIT            DEFAULT ((0)) NULL,
    [luceneadded]   BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_htblhistory] PRIMARY KEY CLUSTERED ([histid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblhistory_htblagents_2] FOREIGN KEY ([agentid2]) REFERENCES [dbo].[htblagents] ([agentid]),
    CONSTRAINT [FK_htblhistory_htblhistorytypes] FOREIGN KEY ([typeid]) REFERENCES [dbo].[htblhistorytypes] ([typeid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblhistory_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblhistory_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]),
    CONSTRAINT [FK_htblhistory_htblusers_2] FOREIGN KEY ([userid2]) REFERENCES [dbo].[htblusers] ([userid]),
    CONSTRAINT [FK_htblhistory_htblusers_3] FOREIGN KEY ([userid3]) REFERENCES [dbo].[htblusers] ([userid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_luceneadded]
    ON [dbo].[htblhistory]([luceneadded] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_htblhistory_8_187863736__K4_K6_K5_K1_K3_K13_K21_K19_K20_K14_K17_K18_2_7_8_9_10_11_12_15_16_22]
    ON [dbo].[htblhistory]([ticketid] ASC, [typeid] ASC, [date] ASC, [histid] ASC, [userid] ASC, [agentid] ASC, [agentid2] ASC, [userid2] ASC, [userid3] ASC, [assetid] ASC, [fieldid] ASC, [ruleid] ASC)
    INCLUDE([action], [status], [reason], [ticketstateid], [tickettypeid], [priority], [teamid], [scheduleid], [noteid], [type]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_htblhistory_8_187863736__K5D_K1_K6_K3_K4_K13_K21_K19_K20_K14_K17_K18_2_7_8_9_10_11_12_15_16_22]
    ON [dbo].[htblhistory]([date] DESC, [histid] ASC, [typeid] ASC, [userid] ASC, [ticketid] ASC, [agentid] ASC, [agentid2] ASC, [userid2] ASC, [userid3] ASC, [assetid] ASC, [fieldid] ASC, [ruleid] ASC)
    INCLUDE([action], [status], [reason], [ticketstateid], [tickettypeid], [priority], [teamid], [scheduleid], [noteid], [type]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_htblhistory_8_187863736__K4_K5]
    ON [dbo].[htblhistory]([ticketid] ASC, [date] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_teamid]
    ON [dbo].[htblhistory]([teamid] ASC)
    INCLUDE([histid], [action], [userid], [ticketid], [date], [typeid], [status], [reason], [ticketstateid], [tickettypeid], [priority], [agentid], [assetid], [scheduleid], [noteid], [fieldid], [ruleid], [userid2], [userid3], [agentid2], [type], [unauthorised], [luceneadded]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_teamid_2]
    ON [dbo].[htblhistory]([teamid] ASC)
    INCLUDE([histid], [ticketid]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_typeid_teamid]
    ON [dbo].[htblhistory]([typeid] ASC, [teamid] ASC)
    INCLUDE([histid], [action], [userid], [ticketid], [date], [status], [reason], [ticketstateid], [tickettypeid], [priority], [agentid], [assetid], [scheduleid], [noteid], [fieldid], [ruleid], [userid2], [userid3], [agentid2], [type], [unauthorised], [luceneadded]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_typeid_status]
    ON [dbo].[htblhistory]([typeid] ASC, [status] ASC)
    INCLUDE([ticketid], [date]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_typeid]
    ON [dbo].[htblhistory]([typeid] ASC)
    INCLUDE([ticketid], [date]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_typeid_noteid]
    ON [dbo].[htblhistory]([typeid] ASC, [noteid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_luceneadded_ticketid]
    ON [dbo].[htblhistory]([luceneadded] ASC, [ticketid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_histid]
    ON [dbo].[htblhistory]([histid] ASC, [typeid] ASC, [date] ASC, [ticketid] ASC, [agentid] ASC, [userid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblhistory_date]
    ON [dbo].[htblhistory]([date] ASC, [typeid] ASC, [histid] ASC, [ticketid] ASC) WITH (FILLFACTOR = 90);

