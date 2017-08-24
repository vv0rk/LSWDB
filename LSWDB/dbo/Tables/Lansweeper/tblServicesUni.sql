CREATE TABLE [dbo].[tblServicesUni] (
    [ServiceuniqueID] INT             IDENTITY (1, 1) NOT NULL,
    [Caption]         NVARCHAR (450)  NULL,
    [Name]            NVARCHAR (450)  NULL,
    [Pathname]        NVARCHAR (1000) NULL,
    [Startname]       NVARCHAR (450)  NULL,
    [Hash]            VARCHAR (40)    NOT NULL,
    CONSTRAINT [PK_tbluniqueservices] PRIMARY KEY CLUSTERED ([ServiceuniqueID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServicesUni_5_891358440__K1]
    ON [dbo].[tblServicesUni]([ServiceuniqueID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServicesUni_5_891358440__K3_1_5]
    ON [dbo].[tblServicesUni]([Name] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblServicesUni_5_891358440__K5_1]
    ON [dbo].[tblServicesUni]([Startname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblServicesUni]
    ON [dbo].[tblServicesUni]([Hash] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

