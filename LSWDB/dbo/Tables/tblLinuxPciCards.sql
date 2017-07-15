CREATE TABLE [dbo].[tblLinuxPciCards] (
    [PciID]                 INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Name]                  NVARCHAR (300) NULL,
    [Manufacturer]          NVARCHAR (300) NULL,
    [Type]                  NVARCHAR (300) NULL,
    [DeviceID]              NVARCHAR (300) NULL,
    [LastChanged]           DATETIME       CONSTRAINT [DF_tblLinuxPciCards_LastChanged] DEFAULT (getdate()) NOT NULL,
    [SubsystemName]         NVARCHAR (200) NULL,
    [SubsystemManufacturer] NVARCHAR (200) NULL,
    CONSTRAINT [PK_tblLinuxPciCards] PRIMARY KEY CLUSTERED ([PciID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxPciCards_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblLinuxPciCards_tblAssets]
    ON [dbo].[tblLinuxPciCards]([AssetID] ASC) WITH (FILLFACTOR = 90);

