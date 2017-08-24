CREATE TABLE [dbo].[tblParallelPortHist] (
    [Trackercode]              INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                  INT            NOT NULL,
    [Availability]             NUMERIC (18)   NULL,
    [Caption]                  NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]   NUMERIC (18)   NULL,
    [ConfigManagerUserConfig]  BIT            NULL,
    [OSAutoDiscovered]         BIT            NULL,
    [PowerManagementSupported] BIT            NULL,
    [ProtocolSupported]        NUMERIC (18)   NULL,
    [Lastchanged]              DATETIME       CONSTRAINT [DF_tblParallelPorthist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                   NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblParallelPorthist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblParallelPorthist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblParallelPorthist_tblAssets]
    ON [dbo].[tblParallelPortHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

