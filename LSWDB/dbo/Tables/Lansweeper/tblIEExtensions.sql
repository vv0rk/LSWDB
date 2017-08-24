CREATE TABLE [dbo].[tblIEExtensions] (
    [IEextID]     INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Control]     NVARCHAR (50)   NULL,
    [Buttontext]  NVARCHAR (500)  NULL,
    [CLSID]       NVARCHAR (100)  NULL,
    [Exec]        NVARCHAR (1000) NULL,
    [Menutext]    NVARCHAR (500)  NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblIEExtensions_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblIEExtensions] PRIMARY KEY CLUSTERED ([IEextID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblIEExtensions_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEExtensions_tblAssets]
    ON [dbo].[tblIEExtensions]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

