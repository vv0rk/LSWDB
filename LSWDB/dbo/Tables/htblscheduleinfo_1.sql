CREATE TABLE [dbo].[htblscheduleinfo] (
    [infoid]      INT            IDENTITY (1, 1) NOT NULL,
    [agentid]     INT            NULL,
    [scheduleid]  INT            NULL,
    [infotype]    INT            DEFAULT ((1)) NOT NULL,
    [title]       NVARCHAR (150) NULL,
    [userid]      INT            NULL,
    [datechanged] DATETIME       CONSTRAINT [DF_htblscheduleinfo_datechanged] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_htblscheduleinfo] PRIMARY KEY CLUSTERED ([infoid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblscheduleinfo_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblscheduleinfo_htblagents]
    ON [dbo].[htblscheduleinfo]([agentid] ASC) WITH (FILLFACTOR = 90);

