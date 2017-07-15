CREATE TABLE [dbo].[TsysWarrantyQueue] (
    [AssetId]   INT      NOT NULL,
    [TimeStamp] DATETIME CONSTRAINT [DF_WarrantyQueue_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WarrantyQueue] PRIMARY KEY CLUSTERED ([AssetId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TsysWarrantyQueue_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);

