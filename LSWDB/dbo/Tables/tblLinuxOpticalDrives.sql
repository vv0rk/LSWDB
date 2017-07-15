CREATE TABLE [dbo].[tblLinuxOpticalDrives] (
    [OpticalDriveID] INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT           NOT NULL,
    [Vendor]         NVARCHAR (50) NULL,
    [Path]           NVARCHAR (20) NULL,
    [Product]        NVARCHAR (50) NULL,
    [Bus]            NVARCHAR (20) NULL,
    [Mount]          NVARCHAR (20) NULL,
    [LastChanged]    DATETIME      CONSTRAINT [DF_tblLinuxOpticalDrives_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxOpticalDrives] PRIMARY KEY CLUSTERED ([OpticalDriveID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxOpticalDrives_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxOpticalDrives_tblAssets]
    ON [dbo].[tblLinuxOpticalDrives]([AssetID] ASC) WITH (FILLFACTOR = 90);

