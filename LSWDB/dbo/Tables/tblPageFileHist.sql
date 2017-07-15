CREATE TABLE [dbo].[tblPageFileHist] (
    [Trackercode]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]      INT            NOT NULL,
    [Archive]      BIT            NULL,
    [Caption]      NVARCHAR (450) NULL,
    [CreationDate] DATETIME       NULL,
    [FileSize]     NUMERIC (18)   NULL,
    [Hidden]       BIT            NULL,
    [InitialSize]  NUMERIC (18)   NULL,
    [InstallDate]  DATETIME       NULL,
    [MaximumSize]  NUMERIC (18)   NULL,
    [Path]         NVARCHAR (450) NULL,
    [Readable]     BIT            NULL,
    [System]       BIT            NULL,
    [Writeable]    BIT            NULL,
    [Lastchanged]  DATETIME       CONSTRAINT [DF_tblPageFilehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]       NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblPageFilehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPageFilehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPageFilehist_tblAssets]
    ON [dbo].[tblPageFileHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

