CREATE TABLE [dbo].[tblMappedDrives] (
    [DriveID]     INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Username]    NVARCHAR (300)  NULL,
    [Driveletter] NVARCHAR (3)    NULL,
    [RemotePath]  NVARCHAR (1024) NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblmappeddrives_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblmappeddrives] PRIMARY KEY CLUSTERED ([DriveID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblmappeddrives_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblmappeddrives_tblAssets]
    ON [dbo].[tblMappedDrives]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

