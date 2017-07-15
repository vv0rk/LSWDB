﻿CREATE TABLE [dbo].[tsysupdate] (
    [Config]                    INT      NOT NULL,
    [Credentials]               DATETIME CONSTRAINT [DF_tsysupdate_Credentials] DEFAULT (getdate()) NULL,
    [License]                   DATETIME CONSTRAINT [DF_tsysupdate_License] DEFAULT (getdate()) NULL,
    [Waittime]                  DATETIME CONSTRAINT [DF_tsysupdate_Waittime] DEFAULT (getdate()) NULL,
    [Files]                     DATETIME CONSTRAINT [DF_tsysupdate_Files] DEFAULT (getdate()) NULL,
    [Registry]                  DATETIME CONSTRAINT [DF_tsysupdate_Registry] DEFAULT (getdate()) NULL,
    [Productkeys]               DATETIME CONSTRAINT [DF_tsysupdate_Productkeys] DEFAULT (getdate()) NULL,
    [EventsIgnore]              DATETIME CONSTRAINT [DF_tsysupdate_EventsIgnore] DEFAULT (getdate()) NULL,
    [EventAlert]                DATETIME CONSTRAINT [DF_tsysupdate_EventAlert] DEFAULT (getdate()) NULL,
    [Mail]                      DATETIME CONSTRAINT [DF_tsysupdate_Mail] DEFAULT (getdate()) NULL,
    [Eventscan]                 DATETIME CONSTRAINT [DF_tsysupdate_Eventscan] DEFAULT (getdate()) NULL,
    [Proxy]                     DATETIME CONSTRAINT [DF_TsysUpdate_Proxy] DEFAULT (getdate()) NOT NULL,
    [MacBlacklist]              DATETIME DEFAULT (getdate()) NULL,
    [ManufacturerTranslation]   DATETIME DEFAULT (getdate()) NULL,
    [IpExcluxions]              DATETIME DEFAULT (getdate()) NOT NULL,
    [RenamedComputerDetection]  DATETIME DEFAULT (getdate()) NOT NULL,
    [Deployment]                DATETIME DEFAULT (getdate()) NOT NULL,
    [AssetTypeExclusions]       DATETIME DEFAULT (getdate()) NOT NULL,
    [DomainExclusions]          DATETIME DEFAULT (getdate()) NULL,
    [ScanHistory]               DATETIME DEFAULT (getdate()) NOT NULL,
    [DomainUserScanning]        DATETIME DEFAULT (getdate()) NOT NULL,
    [ScheduledComputerScanning] DATETIME DEFAULT (getdate()) NOT NULL,
    [AssetGroups]               DATETIME NULL,
    [AsDomains]                 DATETIME NULL,
    [AsOU]                      DATETIME NULL,
    [AssetGroupScan]            DATETIME NULL,
    [AsWorkgroups]              DATETIME NULL,
    [DoNotScan]                 DATETIME NULL,
    [IpScanRanges]              DATETIME NULL,
    [LogSchedule]               DATETIME NULL,
    [MacVendor]                 DATETIME NULL,
    [OidLookup]                 DATETIME NULL,
    [VendorOid]                 DATETIME NULL,
    [AsServers]                 DATETIME NULL,
    [TsysConfig]                DATETIME NULL,
    [DomainControllers]         DATETIME NULL,
    [ASSites]                   DATETIME NULL,
    [ModelTranslation]          DATETIME NULL,
    [SerialTranslation]         DATETIME NULL,
    [SystemSkuTranslation]      DATETIME NULL,
    [HelpDeskMailConfig]        DATETIME DEFAULT (getdate()) NOT NULL,
    [IPLocations]               DATETIME NULL,
    CONSTRAINT [PK_tsysupdate] PRIMARY KEY CLUSTERED ([Config] ASC) WITH (FILLFACTOR = 90)
);

