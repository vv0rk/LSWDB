CREATE TABLE [dbo].[tblIEActiveXHist] (
    [Trackercode] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Control]     NVARCHAR (150)  NULL,
    [CodeBase]    NVARCHAR (1000) NULL,
    [Inf]         NVARCHAR (1000) NULL,
    [OSD]         NVARCHAR (1000) NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblIEActiveXhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)    NULL,
    CONSTRAINT [PK_tblIEActiveXhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblIEActiveXhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEActiveXhist_tblAssets]
    ON [dbo].[tblIEActiveXHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

