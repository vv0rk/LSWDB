CREATE TABLE [dbo].[tblMacApplications] (
    [ApplicationID] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [softid]        INT            NOT NULL,
    [Version]       NVARCHAR (200) NULL,
    [InstallDate]   DATETIME       NULL,
    [LastChanged]   DATETIME       CONSTRAINT [DF_tblMacApplications_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacApplications] PRIMARY KEY CLUSTERED ([ApplicationID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacApplications_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacApplications_tblAssets]
    ON [dbo].[tblMacApplications]([AssetID] ASC) WITH (FILLFACTOR = 90);

