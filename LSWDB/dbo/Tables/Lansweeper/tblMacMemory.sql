CREATE TABLE [dbo].[tblMacMemory] (
    [MemoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT           NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [Size]        NVARCHAR (20) NULL,
    [Speed]       NVARCHAR (20) NULL,
    [Type]        NVARCHAR (20) NULL,
    [Status]      NVARCHAR (20) NULL,
    [LastChanged] DATETIME      CONSTRAINT [DF_tblMacMemory_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacMemory] PRIMARY KEY CLUSTERED ([MemoryID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacMemory_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacMemory_tblAssets]
    ON [dbo].[tblMacMemory]([AssetID] ASC) WITH (FILLFACTOR = 90);

