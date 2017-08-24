CREATE TABLE [dbo].[tblSoftwareUni] (
    [SoftID]            INT            IDENTITY (1, 1) NOT NULL,
    [softwareName]      NVARCHAR (300) NULL,
    [SoftwarePublisher] NVARCHAR (150) NULL,
    [Approved]          INT            CONSTRAINT [DF_tblUniqueSoftware_Approved] DEFAULT ((0)) NOT NULL,
    [OSType]            INT            CONSTRAINT [DF_tblUniqueSoftware_OSType] DEFAULT ((1)) NOT NULL,
    [Added]             DATETIME       CONSTRAINT [DF_tblSoftwareUni_Added] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblUniqueSoftware] PRIMARY KEY CLUSTERED ([SoftID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_9987]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_K2_1912]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC, [softwareName] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_K2_3]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC, [softwareName] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_K2_3_7_9987]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC, [softwareName] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_K3_2_8066]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC, [SoftwarePublisher] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K1_K3_9987]
    ON [dbo].[tblSoftwareUni]([SoftID] ASC, [SoftwarePublisher] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K3_K1_9987]
    ON [dbo].[tblSoftwareUni]([SoftwarePublisher] ASC, [SoftID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblSoftwareUni_7_672877614__K7_K1_K2_8066]
    ON [dbo].[tblSoftwareUni]([Approved] ASC, [SoftID] ASC, [softwareName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSoftwareUni]
    ON [dbo].[tblSoftwareUni]([softwareName] ASC, [SoftwarePublisher] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblSoftwareUni_softwareName]
    ON [dbo].[tblSoftwareUni]([softwareName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

