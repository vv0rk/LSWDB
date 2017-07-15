CREATE TABLE [dbo].[htblscheduletypes] (
    [typeid]         INT            IDENTITY (1, 1) NOT NULL,
    [name]           NVARCHAR (100) NOT NULL,
    [color]          NCHAR (10)     NULL,
    [agentavailable] BIT            DEFAULT ((1)) NULL,
    [default]        BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblscheduletypes] PRIMARY KEY CLUSTERED ([typeid] ASC) WITH (FILLFACTOR = 90)
);

