CREATE TABLE [dbo].[tblNetworkClient] (
    [Win32_NetworkClientid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Caption]               NVARCHAR (450) NULL,
    [Manufacturer]          NVARCHAR (450) NULL,
    [Name]                  NVARCHAR (450) NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblNetworkClient_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblNetworkClient] PRIMARY KEY CLUSTERED ([Win32_NetworkClientid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblNetworkClient_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblNetworkClient_tblAssets]
    ON [dbo].[tblNetworkClient]([AssetID] ASC) WITH (FILLFACTOR = 90);

