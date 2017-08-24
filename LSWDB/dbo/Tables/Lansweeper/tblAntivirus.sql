CREATE TABLE [dbo].[tblAntivirus] (
    [AntivirusId]             INT           IDENTITY (1, 1) NOT NULL,
    [DisplayName]             NVARCHAR (50) NULL,
    [AssetID]                 INT           NOT NULL,
    [ProductState]            INT           NULL,
    [LastChanged]             DATETIME      CONSTRAINT [DF_tblAntivirus_LastChanged] DEFAULT (getdate()) NOT NULL,
    [onAccessScanningEnabled] BIT           NULL,
    [productUpToDate]         BIT           NULL,
    CONSTRAINT [PK_tblAntivirus] PRIMARY KEY CLUSTERED ([AntivirusId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAntivirus_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblAntivirus_tblAssets]
    ON [dbo].[tblAntivirus]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

