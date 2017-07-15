﻿CREATE TABLE [dbo].[rPersonal] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [moddate]     DATETIME       NULL,
    [Company]     NVARCHAR (255) NULL,
    [Filial]      NVARCHAR (255) NULL,
    [Departament] NVARCHAR (255) NULL,
    [Upravlenie]  NVARCHAR (255) NULL,
    [Otdel]       NVARCHAR (255) NULL,
    [Grupa]       NVARCHAR (255) NULL,
    [Tabel]       NVARCHAR (255) NULL,
    [Dolgnost]    NVARCHAR (255) NULL,
    [FIO]         NVARCHAR (255) NULL,
    [Familia]     NVARCHAR (255) NULL,
    [Imya]        NVARCHAR (255) NULL,
    [Otchestvo]   NVARCHAR (255) NULL,
    [DatePr]      DATETIME       NULL,
    [DateUvol]    DATETIME       NULL,
    [Status]      NVARCHAR (10)  NULL,
    CONSTRAINT [id_pk] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

