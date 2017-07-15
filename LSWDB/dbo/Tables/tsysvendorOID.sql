﻿CREATE TABLE [dbo].[tsysvendorOID] (
    [OID]    NUMERIC (18)   NOT NULL,
    [Vendor] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_tsysvendorOID] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 90)
);

