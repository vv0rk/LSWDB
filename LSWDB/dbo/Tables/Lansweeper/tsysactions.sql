CREATE TABLE [dbo].[tsysactions] (
    [Description]  NVARCHAR (300)  NOT NULL,
    [Action]       NVARCHAR (1000) NOT NULL,
    [Icon]         NVARCHAR (50)   NOT NULL,
    [sortorder]    NUMERIC (18)    NULL,
    [enabled]      BIT             CONSTRAINT [DF_tsysactions_enabled] DEFAULT ((1)) NOT NULL,
    [confirmation] BIT             CONSTRAINT [DF_tsysactions_confirmation] DEFAULT ((0)) NOT NULL,
    [Advanced]     BIT             NULL,
    [ishyperlink]  BIT             NULL,
    [ActionID]     INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tsysactions] PRIMARY KEY CLUSTERED ([ActionID] ASC) WITH (FILLFACTOR = 90)
);

