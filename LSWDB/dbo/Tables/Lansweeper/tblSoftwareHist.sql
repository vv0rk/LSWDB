CREATE TABLE [dbo].[tblSoftwareHist] (
    [Trackercode]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT            NOT NULL,
    [softid]          INT            NULL,
    [softwareVersion] NVARCHAR (100) NULL,
    [Installdate]     DATETIME       NULL,
    [Lastchanged]     DATETIME       CONSTRAINT [DF_tblSoftwareHist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]          NUMERIC (18)   NULL,
    [CurrentUser]     BIT            DEFAULT ((0)) NULL,
    [MSI]             BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tblSoftwareHist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSoftwareHist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSoftwareHist_tblAssets]
    ON [dbo].[tblSoftwareHist]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

