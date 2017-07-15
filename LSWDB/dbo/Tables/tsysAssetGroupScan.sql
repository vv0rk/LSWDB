CREATE TABLE [dbo].[tsysAssetGroupScan] (
    [AssetGroupScanID]  INT             IDENTITY (1, 1) NOT NULL,
    [Servername]        NVARCHAR (60)   NOT NULL,
    [Type]              INT             NULL,
    [AssetGroupID]      INT             NULL,
    [AssetType]         INT             NULL,
    [Enabled]           BIT             NULL,
    [Day1]              BIT             NULL,
    [Day2]              BIT             NULL,
    [Day3]              BIT             NULL,
    [Day4]              BIT             NULL,
    [Day5]              BIT             NULL,
    [Day6]              BIT             NULL,
    [Day7]              BIT             NULL,
    [Day1time]          DATETIME        NULL,
    [Day2time]          DATETIME        NULL,
    [Day3time]          DATETIME        NULL,
    [Day4time]          DATETIME        NULL,
    [Day5time]          DATETIME        NULL,
    [Day6time]          DATETIME        NULL,
    [Day7time]          DATETIME        NULL,
    [LastAssetTypescan] DATETIME        NULL,
    [DNS]               BIT             NULL,
    [Recurring]         BIT             NULL,
    [Minutes]           BIT             NULL,
    [Waittime]          INT             NULL,
    [ScanNow]           BIT             DEFAULT ((0)) NOT NULL,
    [Report]            NVARCHAR (200)  NULL,
    [Description]       NVARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([AssetGroupScanID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysAssetGroupScan_tblAssetGroups] FOREIGN KEY ([AssetGroupID]) REFERENCES [dbo].[tblAssetGroups] ([AssetGroupID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tsysassetgroupscan_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tsysAssetGroupScan_tsysReports] FOREIGN KEY ([Report]) REFERENCES [dbo].[tsysreports] ([Reportquery]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetGroupScan_tblAssetGroups]
    ON [dbo].[tsysAssetGroupScan]([AssetGroupID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetGroupScan_tsysASServers]
    ON [dbo].[tsysAssetGroupScan]([Servername] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAssetGroupScan_tsysreports]
    ON [dbo].[tsysAssetGroupScan]([Report] ASC) WITH (FILLFACTOR = 90);

