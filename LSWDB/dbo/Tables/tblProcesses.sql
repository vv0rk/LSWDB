CREATE TABLE [dbo].[tblProcesses] (
    [ProcessID]      INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT             NOT NULL,
    [Caption]        NVARCHAR (450)  NULL,
    [Commandline]    NVARCHAR (1000) NULL,
    [ExecutablePath] NVARCHAR (1000) NULL,
    [Threadcount]    NUMERIC (18)    NULL,
    [Priority]       NUMERIC (18)    NULL,
    [Lastchanged]    DATETIME        CONSTRAINT [DF_tblProcesses_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblProcesses] PRIMARY KEY CLUSTERED ([ProcessID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblProcesses_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblProcesses_5_643585431__K2]
    ON [dbo].[tblProcesses]([AssetID] ASC) WITH (FILLFACTOR = 90);

