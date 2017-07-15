CREATE TABLE [dbo].[htblslapriorities] (
    [slaid]    INT NOT NULL,
    [priority] INT NOT NULL,
    FOREIGN KEY ([priority]) REFERENCES [dbo].[htblpriorities] ([priority]) ON DELETE CASCADE,
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblslapriorities_htblpriorities]
    ON [dbo].[htblslapriorities]([priority] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblslapriorities_htblsla]
    ON [dbo].[htblslapriorities]([slaid] ASC) WITH (FILLFACTOR = 90);

