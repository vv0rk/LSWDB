CREATE TABLE [dbo].[tsysIPScanRanges] (
    [IprangeID]            INT             IDENTITY (1, 1) NOT NULL,
    [Servername]           NVARCHAR (60)   NOT NULL,
    [Ipstart]              VARCHAR (50)    NOT NULL,
    [Ipend]                VARCHAR (50)    NOT NULL,
    [Enabled]              BIT             CONSTRAINT [DF_tsysIPScanRanges_Enabled] DEFAULT ((1)) NOT NULL,
    [PingTimeout]          INT             CONSTRAINT [DF_tsysIPScanRanges_PingTimeout] DEFAULT ((2)) NOT NULL,
    [IPIgnoreWindows]      BIT             CONSTRAINT [DF_tsysIPScanRanges_IPIgnoreWindows] DEFAULT ((0)) NOT NULL,
    [DontPing]             BIT             CONSTRAINT [DF_tsysIPScanRanges_DontPing] DEFAULT ((0)) NOT NULL,
    [Day1]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day1] DEFAULT ((0)) NOT NULL,
    [Day2]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day2] DEFAULT ((0)) NOT NULL,
    [Day3]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day3] DEFAULT ((0)) NOT NULL,
    [Day4]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day4] DEFAULT ((0)) NOT NULL,
    [Day5]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day5] DEFAULT ((0)) NOT NULL,
    [Day6]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day6] DEFAULT ((0)) NOT NULL,
    [Day7]                 BIT             CONSTRAINT [DF_tsysIPScanRanges_Day7] DEFAULT ((0)) NOT NULL,
    [Day1time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day1time] DEFAULT ('00:00:00') NOT NULL,
    [Day2time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day2time] DEFAULT ('00:00:00') NOT NULL,
    [Day3time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day3time] DEFAULT ('00:00:00') NOT NULL,
    [Day4time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day4time] DEFAULT ('00:00:00') NOT NULL,
    [Day5time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day5time] DEFAULT ('00:00:00') NOT NULL,
    [Day6time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day6time] DEFAULT ('00:00:00') NOT NULL,
    [Day7time]             DATETIME        CONSTRAINT [DF_tsysIPScanRanges_Day7time] DEFAULT ('00:00:00') NOT NULL,
    [LastIPscan]           DATETIME        NULL,
    [NoSSH]                BIT             CONSTRAINT [DF_tsysIPScanRanges_NoSSH] DEFAULT ((0)) NOT NULL,
    [Recurring]            BIT             DEFAULT ((0)) NOT NULL,
    [Minutes]              BIT             DEFAULT ((0)) NOT NULL,
    [Waittime]             INT             DEFAULT ((1)) NOT NULL,
    [SSHport]              INT             DEFAULT ((22)) NULL,
    [SavePingedIP]         BIT             DEFAULT ((0)) NOT NULL,
    [IPIgnoreKnownWindows] BIT             DEFAULT ((0)) NOT NULL,
    [Description]          NVARCHAR (1000) NULL,
    [SIPport]              INT             DEFAULT ((5060)) NOT NULL,
    [ScanNow]              BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tsysIPScanRanges] PRIMARY KEY CLUSTERED ([IprangeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysIPScanRanges_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tsysIPScanRanges]
    ON [dbo].[tsysIPScanRanges]([Servername] ASC, [Ipstart] ASC, [Ipend] ASC) WITH (FILLFACTOR = 90);

