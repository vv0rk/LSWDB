CREATE TABLE [dbo].[htblagentlicenses] (
    [licenseid]      INT             IDENTITY (1, 1) NOT NULL,
    [key]            NVARCHAR (2000) NOT NULL,
    [orderreference] NVARCHAR (250)  NULL,
    [licensee]       NVARCHAR (150)  NULL,
    CONSTRAINT [PK_htblagentlicenses] PRIMARY KEY CLUSTERED ([licenseid] ASC) WITH (FILLFACTOR = 90)
);

