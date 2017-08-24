CREATE TABLE [dbo].[TsysLastscan] (
    [AssetID]  INT             NOT NULL,
    [CFGcode]  INT             NOT NULL,
    [Lasttime] DATETIME        CONSTRAINT [DF_tblsyslastscan_Lasttime] DEFAULT (getdate()) NOT NULL,
    [Scantime] NUMERIC (18, 2) NULL,
    CONSTRAINT [PK_TsysLastscan] PRIMARY KEY CLUSTERED ([AssetID] ASC, [CFGcode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_TsysLastscan_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_TsysLastscan_TsysWaittime] FOREIGN KEY ([CFGcode]) REFERENCES [dbo].[TsysWaittime] ([CFGCode]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_TsysLastscan_TsysWaittime]
    ON [dbo].[TsysLastscan]([CFGcode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

