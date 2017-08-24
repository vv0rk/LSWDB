CREATE TABLE [dbo].[TsysRegistry] (
    [RegID]    INT             IDENTITY (1, 1) NOT NULL,
    [Rootkey]  NVARCHAR (50)   NULL,
    [RegPath]  NVARCHAR (1000) NULL,
    [Regvalue] NVARCHAR (200)  NULL,
    [Enabled]  BIT             CONSTRAINT [DF_TsysRegistry_Enabled] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TsysRegistry] PRIMARY KEY CLUSTERED ([RegID] ASC) WITH (FILLFACTOR = 90)
);

