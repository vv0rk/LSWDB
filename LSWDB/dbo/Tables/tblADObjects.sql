CREATE TABLE [dbo].[tblADObjects] (
    [ADObjectID]     INT            IDENTITY (1, 1) NOT NULL,
    [sAMAccountName] NVARCHAR (150) NOT NULL,
    [domain]         NVARCHAR (150) NOT NULL,
    [LastScanned]    DATETIME       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ADObject] PRIMARY KEY CLUSTERED ([ADObjectID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [IX_tblADObjects] UNIQUE NONCLUSTERED ([domain] ASC, [sAMAccountName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

