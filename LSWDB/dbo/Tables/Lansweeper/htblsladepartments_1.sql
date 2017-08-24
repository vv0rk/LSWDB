CREATE TABLE [dbo].[htblsladepartments] (
    [slaid]      INT            NOT NULL,
    [department] NVARCHAR (500) NOT NULL,
    FOREIGN KEY ([slaid]) REFERENCES [dbo].[htblsla] ([slaid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblsladepartments_htblsla]
    ON [dbo].[htblsladepartments]([slaid] ASC) WITH (FILLFACTOR = 90);

