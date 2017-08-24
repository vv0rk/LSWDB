CREATE TABLE [dbo].[tsysWebUsersGlobalTabs] (
    [PageID]    INT NOT NULL,
    [TabID]     INT NOT NULL,
    [Sortorder] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PageID] ASC, [TabID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysWebUsersGlobalTabs_tsysWebTabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[tsysWebTabs] ([TabID]) ON DELETE CASCADE
);

