CREATE TABLE [dbo].[tblServiceState] (
    [StateID] INT          NOT NULL,
    [State]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblServiceState] PRIMARY KEY CLUSTERED ([StateID] ASC) WITH (FILLFACTOR = 90)
);

