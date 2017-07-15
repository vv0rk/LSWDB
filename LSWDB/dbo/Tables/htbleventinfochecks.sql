CREATE TABLE [dbo].[htbleventinfochecks] (
    [EventCheckID] INT IDENTITY (1, 1) NOT NULL,
    [AgentID]      INT NOT NULL,
    [InfoID]       INT NOT NULL,
    CONSTRAINT [PK_htbleventinfochecks] PRIMARY KEY CLUSTERED ([EventCheckID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbleventinfochecks_htblscheduleinfo] FOREIGN KEY ([InfoID]) REFERENCES [dbo].[htblscheduleinfo] ([infoid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htbleventinfochecks_htblscheduleinfo]
    ON [dbo].[htbleventinfochecks]([InfoID] ASC) WITH (FILLFACTOR = 90);

