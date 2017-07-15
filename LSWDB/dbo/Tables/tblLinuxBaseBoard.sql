CREATE TABLE [dbo].[tblLinuxBaseBoard] (
    [BaseBoardID]       INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT           NOT NULL,
    [ProductName]       NVARCHAR (50) NULL,
    [Manufacturer]      NVARCHAR (50) NULL,
    [Version]           NVARCHAR (50) NULL,
    [SerialNumber]      NVARCHAR (50) NULL,
    [LocationInChassis] NVARCHAR (50) NULL,
    [Type]              NVARCHAR (50) NULL,
    [LastChanged]       DATETIME      CONSTRAINT [DF_tblLinuxBaseBoard_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxBaseBoard] PRIMARY KEY CLUSTERED ([BaseBoardID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxBaseBoard_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxBaseBoard_tblAssets]
    ON [dbo].[tblLinuxBaseBoard]([AssetID] ASC) WITH (FILLFACTOR = 90);

