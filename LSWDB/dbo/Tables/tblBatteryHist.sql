CREATE TABLE [dbo].[tblBatteryHist] (
    [Trackercode]                 INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [Availability]                NUMERIC (18)   NULL,
    [BatteryStatus]               NUMERIC (18)   NULL,
    [Chemistry]                   NUMERIC (18)   NULL,
    [DesignCapacity]              NUMERIC (18)   NULL,
    [DeviceID]                    NVARCHAR (450) NULL,
    [Name]                        NVARCHAR (450) NULL,
    [PowerManagementCapabilities] VARCHAR (400)  NULL,
    [PowerManagementSupported]    BIT            NULL,
    [SmartBatteryVersion]         NVARCHAR (50)  NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblBatteryhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                      NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblBatteryhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBatteryhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBatteryhist_tblAssets]
    ON [dbo].[tblBatteryHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

