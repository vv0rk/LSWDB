CREATE TABLE [dbo].[tblNtlog] (
    [EventlogID]    BIGINT   IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT      NOT NULL,
    [Eventcode]     INT      NULL,
    [Eventtype]     SMALLINT NULL,
    [LogfileID]     INT      NULL,
    [MessageID]     INT      NULL,
    [SourcenameID]  INT      NULL,
    [LoguserID]     INT      NULL,
    [TimeGenerated] DATETIME NULL,
    CONSTRAINT [PK_tblntlog] PRIMARY KEY CLUSTERED ([EventlogID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblNtlog_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblntlog_tblntlogfile] FOREIGN KEY ([LogfileID]) REFERENCES [dbo].[tblNtlogFile] ([LogfileID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblntlog_tblntlogmessage] FOREIGN KEY ([MessageID]) REFERENCES [dbo].[tblNtlogMessage] ([MessageID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblntlog_tblntlogsource] FOREIGN KEY ([SourcenameID]) REFERENCES [dbo].[tblNtlogSource] ([SourcenameID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblntlog_tblntloguser] FOREIGN KEY ([LoguserID]) REFERENCES [dbo].[tblNtlogUser] ([LoguserID]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNtlog_7_405784703__K2_K7_1912]
    ON [dbo].[tblNtlog]([AssetID] ASC, [SourcenameID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNtlog_7_405784703__K5_K2_K7_K6_K8_K9_3_4]
    ON [dbo].[tblNtlog]([LogfileID] ASC, [AssetID] ASC, [SourcenameID] ASC, [MessageID] ASC, [LoguserID] ASC, [TimeGenerated] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNtlog_7_405784703__K9D_K2_3_4_6_7_6497]
    ON [dbo].[tblNtlog]([TimeGenerated] DESC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblntlog_tblntlogmessage]
    ON [dbo].[tblNtlog]([MessageID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblntlog_tblntlogsource]
    ON [dbo].[tblNtlog]([SourcenameID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblntlog_tblntloguser]
    ON [dbo].[tblNtlog]([LoguserID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

