CREATE TABLE [dbo].[tblLinuxBios] (
    [BiosID]      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Version]     NVARCHAR (150) NULL,
    [ReleaseDate] NVARCHAR (150) NULL,
    [Address]     NVARCHAR (150) NULL,
    [Vendor]      NVARCHAR (150) NULL,
    [RuntimeSize] NVARCHAR (150) NULL,
    [ROMSize]     NVARCHAR (150) NULL,
    [LastChanged] DATETIME       CONSTRAINT [DF_tblLinuxBios_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxBios] PRIMARY KEY CLUSTERED ([BiosID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxBios_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxBios_tblAssets]
    ON [dbo].[tblLinuxBios]([AssetID] ASC) WITH (FILLFACTOR = 90);

