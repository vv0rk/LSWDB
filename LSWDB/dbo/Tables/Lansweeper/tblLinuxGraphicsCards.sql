CREATE TABLE [dbo].[tblLinuxGraphicsCards] (
    [GraphicsID]            INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Name]                  NVARCHAR (200) NULL,
    [Manufacturer]          NVARCHAR (200) NULL,
    [Type]                  NVARCHAR (200) NULL,
    [DeviceID]              NVARCHAR (200) NULL,
    [LastChanged]           DATETIME       CONSTRAINT [DF_tblLinuxGraphicsCards_LastChanged] DEFAULT (getdate()) NOT NULL,
    [SubsystemName]         NVARCHAR (200) NULL,
    [SubsystemManufacturer] NVARCHAR (200) NULL,
    CONSTRAINT [PK_tblLinuxGraphicsCards] PRIMARY KEY CLUSTERED ([GraphicsID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxGraphicsCards_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxGraphicsCards_tblAssets]
    ON [dbo].[tblLinuxGraphicsCards]([AssetID] ASC) WITH (FILLFACTOR = 90);

