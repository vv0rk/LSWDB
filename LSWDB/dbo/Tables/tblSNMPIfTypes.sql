CREATE TABLE [dbo].[tblSNMPIfTypes] (
    [IfType]     INT           NOT NULL,
    [IfTypename] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_tblSNMPIfTypes] PRIMARY KEY CLUSTERED ([IfType] ASC) WITH (FILLFACTOR = 90)
);

