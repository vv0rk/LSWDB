CREATE TABLE [dbo].[tblCPlogoninfo] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]   INT            NOT NULL,
    [logontime] DATETIME       CONSTRAINT [DF_MYSMSComputers_logontime] DEFAULT (getdate()) NULL,
    [Domain]    NVARCHAR (150) NULL,
    [Username]  NVARCHAR (150) NULL,
    [Ipaddress] VARCHAR (15)   NULL,
    CONSTRAINT [PK_tblCPlogoninfo] PRIMARY KEY NONCLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCPlogoninfo_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE CLUSTERED INDEX [_dta_index_tblCPlogoninfo1]
    ON [dbo].[tblCPlogoninfo]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblCPlogoninfo2]
    ON [dbo].[tblCPlogoninfo]([Domain] ASC, [Username] ASC, [AssetID] ASC, [logontime] DESC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

