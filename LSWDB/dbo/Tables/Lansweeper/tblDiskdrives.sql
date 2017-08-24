CREATE TABLE [dbo].[tblDiskdrives] (
    [diskID]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]            INT            NOT NULL,
    [Caption]            NVARCHAR (20)  NULL,
    [Compressed]         BIT            NULL,
    [Description]        NVARCHAR (450) NULL,
    [DriveType]          NUMERIC (18)   NULL,
    [FileSystem]         NVARCHAR (50)  NULL,
    [Freespace]          NUMERIC (18)   NULL,
    [Size]               NUMERIC (18)   NULL,
    [Volumename]         NVARCHAR (300) NULL,
    [Volumeserialnumber] NVARCHAR (50)  NULL,
    [Lastchanged]        DATETIME       CONSTRAINT [DF_tbldiskdrives_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tbldiskdrives] PRIMARY KEY CLUSTERED ([diskID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDiskdrives_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblDiskdrives_7_2044742537__K2_K6_K3_7_8_9_10_12_9987]
    ON [dbo].[tblDiskdrives]([AssetID] ASC, [DriveType] ASC, [Caption] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

