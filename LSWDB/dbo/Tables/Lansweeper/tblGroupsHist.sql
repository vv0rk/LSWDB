CREATE TABLE [dbo].[tblGroupsHist] (
    [Trackercode] INT          IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT          NOT NULL,
    [GroupID]     INT          NOT NULL,
    [Lastchanged] DATETIME     CONSTRAINT [DF_tblGroupshist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_tblGroupshist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblGroupshist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblGroupshist_tblAssets]
    ON [dbo].[tblGroupsHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

