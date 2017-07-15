CREATE TABLE [dbo].[tblMacNetwork] (
    [NetworkID]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [Name]          NVARCHAR (200) NULL,
    [ServiceOrder]  INT            NULL,
    [Hardware]      NVARCHAR (50)  NULL,
    [BSDDeviceName] NVARCHAR (50)  NULL,
    [Type]          NVARCHAR (50)  NULL,
    [LastChanged]   DATETIME       CONSTRAINT [DF_tblMacNetwork_LastChanged] DEFAULT (getdate()) NOT NULL,
    [Mac]           NVARCHAR (200) NULL,
    [Ipv4]          NVARCHAR (200) NULL,
    [Ipv4Mask]      NVARCHAR (200) NULL,
    [IPv6]          NVARCHAR (200) NULL,
    [IPv6Prefix]    NVARCHAR (200) NULL,
    [Gateway]       NVARCHAR (200) NULL,
    CONSTRAINT [PK_tblMacNetwork] PRIMARY KEY CLUSTERED ([NetworkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacNetwork_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacNetwork_tblAssets]
    ON [dbo].[tblMacNetwork]([AssetID] ASC) WITH (FILLFACTOR = 90);

