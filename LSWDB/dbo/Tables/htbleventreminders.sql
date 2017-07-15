CREATE TABLE [dbo].[htbleventreminders] (
    [EventReminderID] INT      IDENTITY (1, 1) NOT NULL,
    [AgentID]         INT      NOT NULL,
    [EventID]         INT      NOT NULL,
    [Checked]         BIT      CONSTRAINT [DF_htbleventreminders_Checked] DEFAULT ((0)) NOT NULL,
    [NextReminder]    DATETIME NULL,
    CONSTRAINT [PK_htbleventreminders] PRIMARY KEY CLUSTERED ([EventReminderID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbleventreminders_htblschedule] FOREIGN KEY ([EventID]) REFERENCES [dbo].[htblschedule] ([scheduleid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htbleventreminders_htblschedule]
    ON [dbo].[htbleventreminders]([EventID] ASC) WITH (FILLFACTOR = 90);

