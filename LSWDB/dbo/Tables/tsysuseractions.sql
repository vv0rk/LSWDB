CREATE TABLE [dbo].[tsysuseractions] (
    [Description]  NVARCHAR (300)  NOT NULL,
    [Action]       NVARCHAR (1000) NOT NULL,
    [Icon]         NVARCHAR (50)   NOT NULL,
    [sortorder]    NUMERIC (18)    NULL,
    [enabled]      BIT             NOT NULL,
    [confirmation] BIT             NOT NULL,
    [Advanced]     BIT             NULL,
    [ActionID]     INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tsysuseractions] PRIMARY KEY CLUSTERED ([ActionID] ASC) WITH (FILLFACTOR = 90)
);

