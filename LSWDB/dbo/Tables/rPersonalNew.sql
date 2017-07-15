CREATE TABLE [dbo].[rPersonalNew] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Familia]   NVARCHAR (255) NULL,
    [Imya]      NVARCHAR (255) NULL,
    [Otchestvo] NVARCHAR (255) NULL,
    [FIO]       NVARCHAR (255) NULL,
    [Tabel]     NVARCHAR (50)  NULL,
    [DatePriem] DATETIME       NULL,
    [DateUvol]  DATETIME       NULL,
    [idrShtatR] INT            NULL,
    [idOld]     INT            NULL,
    [Status]    NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

