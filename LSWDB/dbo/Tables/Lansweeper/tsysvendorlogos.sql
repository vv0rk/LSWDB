CREATE TABLE [dbo].[tsysvendorlogos] (
    [Vendor] NVARCHAR (200) NOT NULL,
    [logo]   NVARCHAR (150) NULL,
    CONSTRAINT [PK_tsysvendorlogos] PRIMARY KEY CLUSTERED ([Vendor] ASC) WITH (FILLFACTOR = 90)
);

