CREATE TABLE [dbo].[tblServices] (
    [ServiceID]       INT      IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT      NOT NULL,
    [ServiceuniqueID] INT      NOT NULL,
    [Acceptpause]     BIT      NULL,
    [Acceptstop]      BIT      NULL,
    [Desktopinteract] BIT      NULL,
    [Started]         BIT      NOT NULL,
    [StartID]         INT      NULL,
    [StateID]         INT      NULL,
    [Lastchanged]     DATETIME CONSTRAINT [DF_tblservices_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblServices] PRIMARY KEY CLUSTERED ([ServiceID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblServices_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblServices_tblServiceStartMode] FOREIGN KEY ([StartID]) REFERENCES [dbo].[tblServiceStartMode] ([StartID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblServices_tblServiceState] FOREIGN KEY ([StateID]) REFERENCES [dbo].[tblServiceState] ([StateID]),
    CONSTRAINT [FK_tblServices_tbluniqueservices] FOREIGN KEY ([ServiceuniqueID]) REFERENCES [dbo].[tblServicesUni] ([ServiceuniqueID]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServices_5_1026310916__K8_K9_2_3]
    ON [dbo].[tblServices]([StartID] ASC, [StateID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServices_7_1026310916__K3_K2_1912]
    ON [dbo].[tblServices]([ServiceuniqueID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServices_7_1026310916__K7_K3_K2_8066]
    ON [dbo].[tblServices]([Started] ASC, [ServiceuniqueID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServices_7_1026310916__K8_K9_K3_K2_1912]
    ON [dbo].[tblServices]([StartID] ASC, [StateID] ASC, [ServiceuniqueID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblServices_tblAssets]
    ON [dbo].[tblServices]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblServices_tblServiceState]
    ON [dbo].[tblServices]([StateID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE STATISTICS [_dta_stat_1026310916_2_8]
    ON [dbo].[tblServices]([AssetID], [StartID]);


GO
CREATE STATISTICS [_dta_stat_1026310916_3_2_8]
    ON [dbo].[tblServices]([ServiceuniqueID], [AssetID], [StartID]);

