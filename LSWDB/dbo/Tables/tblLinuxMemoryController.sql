CREATE TABLE [dbo].[tblLinuxMemoryController] (
    [ControllerID]        INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT            NOT NULL,
    [SupportedInterleave] NVARCHAR (50)  NULL,
    [CurrentInterleave]   NVARCHAR (50)  NULL,
    [MaxMemoryModuleSize] NVARCHAR (20)  NULL,
    [MaxTotalMemorySize]  NVARCHAR (20)  NULL,
    [SupportedSpeeds]     NVARCHAR (100) NULL,
    [SupportedMemTypes]   NVARCHAR (100) NULL,
    [MemoryModuleVoltage] NVARCHAR (10)  NULL,
    [NumberOfSlots]       NVARCHAR (10)  NULL,
    [LastChanged]         DATETIME       CONSTRAINT [DF_tblLinuxMemoryController_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxMemoryController] PRIMARY KEY CLUSTERED ([ControllerID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxMemoryController_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxMemoryController_tblAssets]
    ON [dbo].[tblLinuxMemoryController]([AssetID] ASC) WITH (FILLFACTOR = 90);

