CREATE TABLE [dbo].[tblIEActiveX] (
    [IEactivexID] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Control]     NVARCHAR (150)  NULL,
    [CodeBase]    NVARCHAR (1000) NULL,
    [Inf]         NVARCHAR (1000) NULL,
    [OSD]         NVARCHAR (1000) NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblIEActiveX_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblIEActiveX] PRIMARY KEY CLUSTERED ([IEactivexID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblIEActiveX_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblIEActiveX_7_1004738832__K3_K2_K7_9987]
    ON [dbo].[tblIEActiveX]([Control] ASC, [AssetID] ASC, [Lastchanged] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEActiveX_tblAssets]
    ON [dbo].[tblIEActiveX]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE STATISTICS [_dta_stat_1004738832_7]
    ON [dbo].[tblIEActiveX]([Lastchanged]);

