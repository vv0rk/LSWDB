CREATE TABLE [dbo].[tblSoftware] (
    [SoftwareID]      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT            NOT NULL,
    [softID]          INT            NOT NULL,
    [softwareVersion] NVARCHAR (100) NULL,
    [Installdate]     DATETIME       NULL,
    [Lastchanged]     DATETIME       CONSTRAINT [DF_software_dateModified] DEFAULT (getdate()) NOT NULL,
    [CurrentUser]     BIT            DEFAULT ((0)) NULL,
    [MSI]             BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_software] PRIMARY KEY CLUSTERED ([SoftwareID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSoftware_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblSoftware_tblUniqueSoftware] FOREIGN KEY ([softID]) REFERENCES [dbo].[tblSoftwareUni] ([SoftID]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K2_8066]
    ON [dbo].[tblSoftware]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K2_K3_8258]
    ON [dbo].[tblSoftware]([AssetID] ASC, [softID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K2_K3_K4_5_6]
    ON [dbo].[tblSoftware]([AssetID] ASC, [softID] ASC, [softwareVersion] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K3_K2_4149]
    ON [dbo].[tblSoftware]([softID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K3_K2_K4_8066]
    ON [dbo].[tblSoftware]([softID] ASC, [AssetID] ASC, [softwareVersion] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftware_7_1266311771__K4_2_3_9987]
    ON [dbo].[tblSoftware]([softwareVersion] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

