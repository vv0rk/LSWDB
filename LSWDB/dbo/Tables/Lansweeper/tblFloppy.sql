CREATE TABLE [dbo].[tblFloppy] (
    [floppyID]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [bytespersector]    NUMERIC (18)   NULL,
    [InterfaceType]     NVARCHAR (450) NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
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
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblfloppy_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [FirmwareRevision]  NVARCHAR (250) NULL,
    [SerialNumber]      NVARCHAR (250) NULL,
    [Status]            NVARCHAR (15)  NULL,
    CONSTRAINT [PK_tblfloppy] PRIMARY KEY CLUSTERED ([floppyID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblFloppy_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblFloppy_tblAssets]
    ON [dbo].[tblFloppy]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

