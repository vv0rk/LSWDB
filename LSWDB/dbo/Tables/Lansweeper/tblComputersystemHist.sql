CREATE TABLE [dbo].[tblComputersystemHist] (
    [Trackercode]               INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]                   INT             NOT NULL,
    [AdminPasswordStatus]       NUMERIC (18)    NULL,
    [AutomaticResetBootOption]  BIT             NULL,
    [AutomaticResetCapability]  BIT             NULL,
    [BootOptionOnLimit]         NUMERIC (18)    NULL,
    [BootoptionOnWatchDog]      NUMERIC (18)    NULL,
    [BootRomSupported]          BIT             NULL,
    [ChassisBootupState]        NUMERIC (18)    NULL,
    [CurrentTimeZone]           NUMERIC (18)    NULL,
    [DaylightInEffect]          BIT             NULL,
    [Domainrole]                INT             NULL,
    [EnableDaylightSavingsTime] BIT             NULL,
    [FrontPanelResetStatus]     NUMERIC (18)    NULL,
    [Infraredsupported]         BIT             NULL,
    [KeyboardPasswordStatus]    NUMERIC (18)    NULL,
    [NetworkServerModeEnabled]  BIT             NULL,
    [NumberOfLogicalProcessors] NUMERIC (18)    NULL,
    [NumberOfProcessors]        NUMERIC (18)    NULL,
    [PartOfDomain]              BIT             NULL,
    [PauseAfterReset]           NUMERIC (18)    NULL,
    [PowerOnPasswordStatus]     NUMERIC (18)    NULL,
    [Powerstate]                NUMERIC (18)    NULL,
    [PowerSupplyState]          NUMERIC (18)    NULL,
    [ResetCapability]           NUMERIC (18)    NULL,
    [ResetCount]                NUMERIC (18)    NULL,
    [Resetlimit]                NUMERIC (18)    NULL,
    [Roles]                     NVARCHAR (1000) NULL,
    [SystemStartupDelay]        NUMERIC (18)    NULL,
    [SystemStartupSetting]      NUMERIC (18)    NULL,
    [SystemType]                NVARCHAR (450)  NULL,
    [ThermalState]              NUMERIC (18)    NULL,
    [TotalPhysicalMemory]       NUMERIC (18)    NULL,
    [Wakeuptype]                NUMERIC (18)    NULL,
    [Lastchanged]               DATETIME        CONSTRAINT [DF_tblComputersystemhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                    NUMERIC (18)    NOT NULL,
    CONSTRAINT [PK_tblComputersystemhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblComputersystemhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblComputersystemhist_tblAssets]
    ON [dbo].[tblComputersystemHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

