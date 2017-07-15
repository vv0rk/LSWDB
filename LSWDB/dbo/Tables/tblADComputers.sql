CREATE TABLE [dbo].[tblADComputers] (
    [AdcomputerID]      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Comment]           NVARCHAR (800) NULL,
    [Company]           NVARCHAR (500) NULL,
    [Description]       NVARCHAR (500) NULL,
    [Location]          NVARCHAR (500) NULL,
    [OU]                NVARCHAR (500) NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblADComputers_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [ADObjectID]        INT            NULL,
    [ManagerADObjectId] INT            NULL,
    CONSTRAINT [PK_tblADComputers] PRIMARY KEY NONCLUSTERED ([AdcomputerID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblADComputers_tblADObjects] FOREIGN KEY ([ADObjectID]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblADComputers_tblADObjects1] FOREIGN KEY ([ManagerADObjectId]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]),
    CONSTRAINT [FK_tblADComputers_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE CLUSTERED INDEX [_dta_index_tblADComputers_c_7_165783848__K2_4364]
    ON [dbo].[tblADComputers]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADComputers_7_165783848__K2_7]
    ON [dbo].[tblADComputers]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADComputers_OU]
    ON [dbo].[tblADComputers]([OU] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADComputers_tblADObjects]
    ON [dbo].[tblADComputers]([ADObjectID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADComputers_tblADObjects1]
    ON [dbo].[tblADComputers]([ManagerADObjectId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

