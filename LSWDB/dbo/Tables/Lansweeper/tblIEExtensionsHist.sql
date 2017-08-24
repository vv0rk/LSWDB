CREATE TABLE [dbo].[tblIEExtensionsHist] (
    [Trackercode] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Control]     NVARCHAR (50)   NULL,
    [Buttontext]  NVARCHAR (500)  NULL,
    [CLSID]       NVARCHAR (100)  NULL,
    [Exec]        NVARCHAR (1000) NULL,
    [Menutext]    NVARCHAR (500)  NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblIEExtensionshist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)    NOT NULL,
    CONSTRAINT [PK_tblIEExtensionshist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblIEExtensionshist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEExtensionshist_tblAssets]
    ON [dbo].[tblIEExtensionsHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

