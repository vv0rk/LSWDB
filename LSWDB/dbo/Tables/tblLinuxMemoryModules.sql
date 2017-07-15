CREATE TABLE [dbo].[tblLinuxMemoryModules] (
    [MemoryModuleID]  INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT           NOT NULL,
    [Socket]          NVARCHAR (20) NULL,
    [BankConnections] NVARCHAR (20) NULL,
    [CurrentSpeed]    NVARCHAR (20) NULL,
    [Type]            NVARCHAR (20) NULL,
    [InstalledSize]   NVARCHAR (50) NULL,
    [EnabledSize]     NVARCHAR (50) NULL,
    [ErrorStatus]     NVARCHAR (20) NULL,
    [LastChanged]     DATETIME      CONSTRAINT [DF_tblLinuxMemoryModules_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxMemoryModules] PRIMARY KEY CLUSTERED ([MemoryModuleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxMemoryModules_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxMemoryModules_tblAssets]
    ON [dbo].[tblLinuxMemoryModules]([AssetID] ASC) WITH (FILLFACTOR = 90);

