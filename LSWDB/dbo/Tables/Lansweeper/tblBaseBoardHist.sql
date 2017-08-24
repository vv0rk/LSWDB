CREATE TABLE [dbo].[tblBaseBoardHist] (
    [Trackercode]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]      INT            NOT NULL,
    [HostingBoard] BIT            NULL,
    [Manufacturer] NVARCHAR (450) NULL,
    [Product]      NVARCHAR (450) NULL,
    [SerialNumber] NVARCHAR (450) NULL,
    [Version]      NVARCHAR (255) NULL,
    [Lastchanged]  DATETIME       CONSTRAINT [DF_tblBaseBoardhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]       NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblBaseBoardhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBaseBoardhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBaseBoardhist_tblAssets]
    ON [dbo].[tblBaseBoardHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

