CREATE TABLE [dbo].[htblscheduleagents] (
    [scheduleagentid] INT      IDENTITY (1, 1) NOT NULL,
    [scheduleid]      INT      NOT NULL,
    [agentid]         INT      NOT NULL,
    [nextreminder]    DATETIME DEFAULT (getdate()) NOT NULL,
    [status]          BIT      DEFAULT ((0)) NOT NULL,
    [checked]         BIT      DEFAULT ((0)) NOT NULL,
    [editAllowed]     BIT      DEFAULT ((1)) NULL,
    CONSTRAINT [PK_htblscheduleagents] PRIMARY KEY CLUSTERED ([scheduleagentid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblscheduleagents_htblschedule] FOREIGN KEY ([scheduleid]) REFERENCES [dbo].[htblschedule] ([scheduleid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblscheduleagents_htblschedule]
    ON [dbo].[htblscheduleagents]([scheduleid] ASC) WITH (FILLFACTOR = 90);

