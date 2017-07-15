CREATE TABLE [dbo].[htblautomaticcloseticketstates] (
    [autocloseid]   INT NOT NULL,
    [ticketstateid] INT NOT NULL,
    CONSTRAINT [pk_htblautomaticcloseticketstates] PRIMARY KEY CLUSTERED ([autocloseid] ASC, [ticketstateid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblautomaticcloseticketstates_htblautomaticclose] FOREIGN KEY ([autocloseid]) REFERENCES [dbo].[htblautomaticclose] ([autocloseid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblautomaticcloseticketstates_htblticketstates] FOREIGN KEY ([ticketstateid]) REFERENCES [dbo].[htblticketstates] ([ticketstateid]) ON DELETE CASCADE
);

