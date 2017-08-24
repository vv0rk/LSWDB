CREATE TABLE [dbo].[tblAutorunUni] (
    [AutorunUNI] INT            IDENTITY (1, 1) NOT NULL,
    [Caption]    NVARCHAR (100) NULL,
    [Command]    NVARCHAR (350) NULL,
    CONSTRAINT [PK_tblAutorunUni] PRIMARY KEY CLUSTERED ([AutorunUNI] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAutorunUni_7_1648881091__K1_K3_4364]
    ON [dbo].[tblAutorunUni]([AutorunUNI] ASC, [Command] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblAutorunUni]
    ON [dbo].[tblAutorunUni]([Caption] ASC, [Command] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

