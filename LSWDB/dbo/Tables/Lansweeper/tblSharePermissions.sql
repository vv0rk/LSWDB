CREATE TABLE [dbo].[tblSharePermissions] (
    [permissionId] INT           IDENTITY (1, 1) NOT NULL,
    [ShareID]      INT           NOT NULL,
    [trustee]      NVARCHAR (64) NULL,
    [readAccess]   BIT           NULL,
    [writeAccess]  BIT           NULL,
    [fullAccess]   BIT           NULL,
    [denyAccess]   BIT           NULL,
    [lastChanged]  DATETIME      CONSTRAINT [DF_tblSharePermissions_lastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblSharePermissions] PRIMARY KEY CLUSTERED ([permissionId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSharePermissions_tblShares] FOREIGN KEY ([ShareID]) REFERENCES [dbo].[tblShares] ([ShareID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSharePermissions_tblShares]
    ON [dbo].[tblSharePermissions]([ShareID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

