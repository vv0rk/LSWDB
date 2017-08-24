CREATE TABLE [dbo].[tblComputersystem] (
    [ComputersystemID]          INT             IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]               DATETIME        CONSTRAINT [DF_tblComputersystem_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Model]                     NVARCHAR (255)  NULL,
    CONSTRAINT [PK__tblComputersystem] PRIMARY KEY CLUSTERED ([ComputersystemID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblComputersystem_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblComputersystem_tblDomainroles] FOREIGN KEY ([Domainrole]) REFERENCES [dbo].[tblDomainroles] ([Domainrole]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K12_2_1410]
    ON [dbo].[tblComputersystem]([Domainrole] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K12_K2_31_4364]
    ON [dbo].[tblComputersystem]([Domainrole] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K12_K2_4364]
    ON [dbo].[tblComputersystem]([Domainrole] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K15_2_8066]
    ON [dbo].[tblComputersystem]([Infraredsupported] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K2_12]
    ON [dbo].[tblComputersystem]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K2_28_9987]
    ON [dbo].[tblComputersystem]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K2_31_8066]
    ON [dbo].[tblComputersystem]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K20_2_8066]
    ON [dbo].[tblComputersystem]([PartOfDomain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K31_2_9987]
    ON [dbo].[tblComputersystem]([SystemType] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K34_2_9987]
    ON [dbo].[tblComputersystem]([Wakeuptype] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K34_K2_4364]
    ON [dbo].[tblComputersystem]([Wakeuptype] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K4_K2_4364]
    ON [dbo].[tblComputersystem]([AutomaticResetBootOption] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblComputersystem_7_697261739__K9_K2_4364]
    ON [dbo].[tblComputersystem]([ChassisBootupState] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

