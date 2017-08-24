CREATE TABLE [dbo].[tblBaseBoard] (
    [Win32_BaseBoardid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [HostingBoard]      BIT            NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [Product]           NVARCHAR (450) NULL,
    [SerialNumber]      NVARCHAR (450) NULL,
    [Version]           NVARCHAR (255) NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblBaseBoard_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblBaseBoard] PRIMARY KEY CLUSTERED ([Win32_BaseBoardid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblBaseBoard_Assets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBaseBoard_Assets]
    ON [dbo].[tblBaseBoard]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

