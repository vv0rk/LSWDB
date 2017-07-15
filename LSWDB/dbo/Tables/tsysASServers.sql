﻿CREATE TABLE [dbo].[tsysASServers] (
    [Servername]                  NVARCHAR (60)   NOT NULL,
    [Servicestarted]              DATETIME        NULL,
    [Servicelastpolled]           DATETIME        NULL,
    [Computerscanned]             NUMERIC (18)    NULL,
    [activescanning]              BIT             CONSTRAINT [DF_tsysASServers_activescanning] DEFAULT ((0)) NOT NULL,
    [workgroupscanning]           BIT             CONSTRAINT [DF_tsysASServers_workgroupscanning] DEFAULT ((0)) NULL,
    [Version]                     VARCHAR (50)    NULL,
    [Listenport]                  NUMERIC (18)    CONSTRAINT [DF_tsysASServers_Listenport] DEFAULT ((9524)) NOT NULL,
    [ConcurrentThreads]           NUMERIC (18)    CONSTRAINT [DF_tsysASServers_ConcurrentThreads] DEFAULT ((6)) NOT NULL,
    [IPscanThreads]               NUMERIC (18)    CONSTRAINT [DF_tsysASServers_IPscanThreads] DEFAULT ((6)) NOT NULL,
    [RMADCOMP]                    BIT             CONSTRAINT [DF_tsysASServers_RMADCOMP] DEFAULT ((0)) NOT NULL,
    [NAADCOMP]                    BIT             CONSTRAINT [DF_tsysASServers_NAADCOMP] DEFAULT ((0)) NOT NULL,
    [RMADUSER]                    BIT             CONSTRAINT [DF_tsysASServers_RMADUSER] DEFAULT ((0)) NOT NULL,
    [MAKEACTIVE]                  BIT             CONSTRAINT [DF_tsysASServers_MAKEACTIVE] DEFAULT ((0)) NOT NULL,
    [DELHIST]                     BIT             CONSTRAINT [DF_tsysASServers_DELHIST] DEFAULT ((0)) NOT NULL,
    [DELHISTDAYS]                 NUMERIC (18)    CONSTRAINT [DF_tsysASServers_DELHISTDAYS] DEFAULT ((60)) NOT NULL,
    [DELCOMP]                     BIT             CONSTRAINT [DF_tsysASServers_DELCOMP] DEFAULT ((0)) NOT NULL,
    [DELCOMPDAYS]                 NUMERIC (18)    CONSTRAINT [DF_tsysASServers_DELCOMPDAYS] DEFAULT ((180)) NOT NULL,
    [NACOMP]                      BIT             CONSTRAINT [DF_tsysASServers_NACOMP] DEFAULT ((0)) NOT NULL,
    [NACOMPDAYS]                  NUMERIC (18)    CONSTRAINT [DF_tsysASServers_NACOMPDAYS] DEFAULT ((180)) NOT NULL,
    [DELEVENTDAYS]                NUMERIC (18)    CONSTRAINT [DF_tsysASServers_DELEVENTDAYS] DEFAULT ((60)) NOT NULL,
    [DELSYSLOGDAYS]               NUMERIC (18)    CONSTRAINT [DF_tsysASServers_DELSYSLOGDAYS] DEFAULT ((30)) NOT NULL,
    [REFRADCOMP]                  BIT             CONSTRAINT [DF_tsysASServers_REFRADCOMP] DEFAULT ((0)) NOT NULL,
    [REFRADUSERS]                 BIT             CONSTRAINT [DF_tsysASServers_REFRADUSERS] DEFAULT ((0)) NOT NULL,
    [SMTPserver]                  VARCHAR (250)   NULL,
    [SMTPport]                    NUMERIC (18)    CONSTRAINT [DF_tsysASServers_SMTPport] DEFAULT ((25)) NULL,
    [SMTPFROM]                    VARCHAR (250)   CONSTRAINT [DF_tsysASServers_SMTPFROM] DEFAULT ('noreply@localhost') NULL,
    [SMTPFROMDISPLAY]             VARCHAR (250)   CONSTRAINT [DF_tsysASServers_SMTPFROMDISPLAY] DEFAULT ('Lansweeper alert') NULL,
    [SMTPAuthenticate]            BIT             CONSTRAINT [DF_tsysASServers_SMTPAuthenticate] DEFAULT ((0)) NULL,
    [SMTPUsername]                NVARCHAR (255)  NULL,
    [SMTPPassword]                VARCHAR (4000)  NULL,
    [SendAlertreports]            BIT             CONSTRAINT [DF_tsysASServers_SendAlertreports] DEFAULT ((0)) NOT NULL,
    [SendEventAlerts]             BIT             CONSTRAINT [DF_tsysASServers_SendEventAlerts] DEFAULT ((0)) NOT NULL,
    [Mailnow]                     BIT             CONSTRAINT [DF_tsysASServers_Mailnow] DEFAULT ((0)) NOT NULL,
    [IPscannow]                   BIT             CONSTRAINT [DF_tsysASServers_IPscannow] DEFAULT ((0)) NOT NULL,
    [Day1rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day11] DEFAULT ((0)) NOT NULL,
    [Day2rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day21] DEFAULT ((0)) NOT NULL,
    [Day3rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day31] DEFAULT ((0)) NOT NULL,
    [Day4rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day41] DEFAULT ((0)) NOT NULL,
    [Day5rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day51] DEFAULT ((0)) NOT NULL,
    [Day6rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day61] DEFAULT ((0)) NOT NULL,
    [Day7rep]                     BIT             CONSTRAINT [DF_tsysASServers_Day71] DEFAULT ((0)) NOT NULL,
    [Day1timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day1time1] DEFAULT ('00:00:00') NOT NULL,
    [Day2timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day2time1] DEFAULT ('00:00:00') NOT NULL,
    [Day3timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day3time1] DEFAULT ('00:00:00') NOT NULL,
    [Day4timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day4time1] DEFAULT ('00:00:00') NOT NULL,
    [Day5timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day5time1] DEFAULT ('00:00:00') NOT NULL,
    [Day6timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day6time1] DEFAULT ('00:00:00') NOT NULL,
    [Day7timerep]                 DATETIME        CONSTRAINT [DF_tsysASServers_Day7time1] DEFAULT ('00:00:00') NOT NULL,
    [Lastmailed]                  DATETIME        NULL,
    [RMDIUSER]                    BIT             CONSTRAINT [DF_tsysASServers_RMDIUSER] DEFAULT ((0)) NOT NULL,
    [RMDICOMP]                    BIT             CONSTRAINT [DF_tsysASServers_RMDICOMP] DEFAULT ((0)) NOT NULL,
    [NADICOMP]                    BIT             CONSTRAINT [DF_tsysASServers_NADICOMP] DEFAULT ((0)) NOT NULL,
    [Scanuser]                    NVARCHAR (300)  NULL,
    [EVinfo]                      BIT             CONSTRAINT [DF_tsysASServers_EVinfo] DEFAULT ((0)) NOT NULL,
    [EVsuccess]                   BIT             CONSTRAINT [DF_tsysASServers_EVsuccess] DEFAULT ((0)) NOT NULL,
    [EVUptime]                    BIT             CONSTRAINT [DF_tsysASServers_EVUptime] DEFAULT ((1)) NOT NULL,
    [DELUptimeDays]               INT             CONSTRAINT [DF_tsysASServers_DELUptimeDays] DEFAULT ((240)) NOT NULL,
    [EVwarning]                   BIT             CONSTRAINT [DF_tsysASServers_EVwarning] DEFAULT ((0)) NOT NULL,
    [EVfailure]                   BIT             CONSTRAINT [DF_tsysASServers_EVfailure] DEFAULT ((0)) NOT NULL,
    [DELLOGONINFO]                INT             CONSTRAINT [DF_tsysASServers_DELLOGONINFO] DEFAULT ((240)) NOT NULL,
    [IsDomain]                    BIT             CONSTRAINT [DF_tsysASServers_IsDomain] DEFAULT ((0)) NOT NULL,
    [DomainName]                  NVARCHAR (50)   NULL,
    [DNSName]                     NVARCHAR (300)  NULL,
    [StartIP]                     VARCHAR (50)    NULL,
    [EndIP]                       VARCHAR (50)    NULL,
    [SMTPUseSSL]                  BIT             CONSTRAINT [DF_tsysASServers_SMTPUseSSL] DEFAULT ((0)) NOT NULL,
    [enableProxy]                 BIT             CONSTRAINT [DF_TsysAsServers_enableProxy] DEFAULT ((0)) NOT NULL,
    [proxyName]                   NVARCHAR (100)  NULL,
    [proxyPort]                   INT             NULL,
    [enableProxyAuth]             BIT             CONSTRAINT [DF_TsysAsServers_enableProxyAuth] DEFAULT ((0)) NOT NULL,
    [proxyLogin]                  NVARCHAR (255)  NULL,
    [proxyPassword]               NVARCHAR (1000) NULL,
    [proxyDomain]                 NVARCHAR (255)  NULL,
    [enableWarrantyScanning]      BIT             CONSTRAINT [DF_TsysAsServers_enableWarrantyScanning] DEFAULT ((0)) NOT NULL,
    [CurrentUser]                 NVARCHAR (500)  DEFAULT ('') NOT NULL,
    [AssetGroupsScannow]          BIT             NULL,
    [renamedComputerDetection]    BIT             DEFAULT ((0)) NOT NULL,
    [LastActiveScan]              DATETIME        DEFAULT ((0)) NOT NULL,
    [MaxDeploymentThreads]        INT             DEFAULT ((12)) NULL,
    [DELDEPLOYMENTLOGDAYS]        NUMERIC (18)    DEFAULT ((60)) NOT NULL,
    [ScanHistoryDays]             INT             CONSTRAINT [DF_tsysASServers_ScanHistoryDays] DEFAULT ((-1)) NOT NULL,
    [ActiveScanningMaxRescanTime] INT             DEFAULT (((48)*(60))*(60)) NOT NULL,
    [ActiveScanningMinRescanTime] INT             DEFAULT (((20)*(60))*(60)) NOT NULL,
    [ActiveScanningInterval]      INT             DEFAULT ((15)*(60)) NOT NULL,
    [ClearQueue]                  BIT             DEFAULT ((0)) NOT NULL,
    [mailserver]                  BIT             DEFAULT ((0)) NOT NULL,
    [ProxyPasswordKeyHash]        INT             NULL,
    [EncryptionKeyHash]           INT             NULL,
    [Delconfigurationlogdays]     INT             CONSTRAINT [DF_tsysASServers_Delconfigurationlogdays] DEFAULT ((90)) NOT NULL,
    [Delloginlogdays]             INT             CONSTRAINT [DF_tsysASServers_Delloginlogdays] DEFAULT ((90)) NOT NULL,
    CONSTRAINT [PK_tsysASServers] PRIMARY KEY CLUSTERED ([Servername] ASC) WITH (FILLFACTOR = 90)
);
