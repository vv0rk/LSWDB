CREATE TABLE [dbo].[tblErrors] (
    [Teller]      INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [CFGname]     VARCHAR (20)    NULL,
    [ErrorText]   NVARCHAR (2000) NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_TsysErrors_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [ErrorType]   INT             CONSTRAINT [DF_tblErrors_ErrorType] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TblErrors] PRIMARY KEY CLUSTERED ([Teller] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblErrors_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblErrors_tsysasseterrortypes] FOREIGN KEY ([ErrorType]) REFERENCES [dbo].[tsysasseterrortypes] ([Errortype]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[tblErrors] NOCHECK CONSTRAINT [FK_tblErrors_tsysasseterrortypes];


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblErrors_7_1532740713__K2_K6_K5_3_4]
    ON [dbo].[tblErrors]([AssetID] ASC, [ErrorType] ASC, [Lastchanged] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblErrors_tsysasseterrortypes]
    ON [dbo].[tblErrors]([ErrorType] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

