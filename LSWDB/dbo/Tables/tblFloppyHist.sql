CREATE TABLE [dbo].[tblFloppyHist] (
    [Trackercode]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [bytespersector]    NUMERIC (18)   NULL,
    [InterfaceType]     NVARCHAR (100) NULL,
    [Manufacturer]      NVARCHAR (300) NULL,
    [Model]             NVARCHAR (450) NULL,
    [Name]              NVARCHAR (450) NULL,
    [Partitions]        NUMERIC (18)   NULL,
    [Sectorspertrack]   NUMERIC (18)   NULL,
    [Size]              NUMERIC (18)   NULL,
    [Totalcylinders]    NUMERIC (18)   NULL,
    [Totalheads]        NUMERIC (18)   NULL,
    [Totalsectors]      NUMERIC (18)   NULL,
    [Totaltracks]       NUMERIC (18)   NULL,
    [TracksperCylinder] NUMERIC (18)   NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblFloppyhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]            NUMERIC (18)   NULL,
    [FirmwareRevision]  NVARCHAR (250) NULL,
    [SerialNumber]      NVARCHAR (250) NULL,
    [Status]            NVARCHAR (15)  NULL,
    CONSTRAINT [PK_tblFloppyhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblFloppyhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblFloppyhist_tblAssets]
    ON [dbo].[tblFloppyHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

