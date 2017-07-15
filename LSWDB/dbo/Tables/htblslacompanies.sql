CREATE TABLE [dbo].[htblslacompanies] (
    [slaid]   INT            NOT NULL,
    [company] NVARCHAR (100) NOT NULL,
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblslacompanies_htblsla]
    ON [dbo].[htblslacompanies]([slaid] ASC) WITH (FILLFACTOR = 90);

