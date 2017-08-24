CREATE TABLE [dbo].[tblTapeDriveHist] (
    [Trackercode]            INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Availability]           NUMERIC (18)   NULL,
    [Capabilities]           NVARCHAR (500) NULL,
    [Caption]                NVARCHAR (450) NULL,
    [Compression]            NUMERIC (18)   NULL,
    [DefaultBlockSize]       NUMERIC (18)   NULL,
    [Manufacturer]           NVARCHAR (450) NULL,
    [MaxBlockSize]           NUMERIC (18)   NULL,
    [MaxMediaSize]           NUMERIC (18)   NULL,
    [MaxPartitionCount]      NUMERIC (18)   NULL,
    [MediaType]              NVARCHAR (450) NULL,
    [MinBlockSize]           NUMERIC (18)   NULL,
    [NeedsCleaning]          BIT            NULL,
    [NumberOfMediaSupported] NUMERIC (18)   NULL,
    [Padding]                NUMERIC (18)   NULL,
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblTapeDrivehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                 NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblTapeDrivehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblTapeDrivehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblTapeDrivehist_tblAssets]
    ON [dbo].[tblTapeDriveHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

