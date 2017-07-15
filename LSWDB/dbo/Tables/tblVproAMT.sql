CREATE TABLE [dbo].[tblVproAMT] (
    [VproAmdID]       INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT           NOT NULL,
    [DefaultTTL]      NVARCHAR (50) NULL,
    [HTTPS]           BIT           CONSTRAINT [DF_tblVproAMT_HTTPS] DEFAULT ((0)) NULL,
    [HTTPVersion]     NVARCHAR (50) NULL,
    [RMCPPingVersion] NVARCHAR (50) NULL,
    [RMCPPingStatus]  NVARCHAR (50) NULL,
    [Lastchanged]     DATETIME      CONSTRAINT [DF_Table_1_Lastchanged1] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([VproAmdID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVproAMT_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblVproAMT_tblAssets]
    ON [dbo].[tblVproAMT]([AssetID] ASC) WITH (FILLFACTOR = 90);

