CREATE TABLE [dbo].[tblServiceStartMode] (
    [StartID]   INT          NOT NULL,
    [StartMode] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblServiceStartMode] PRIMARY KEY CLUSTERED ([StartID] ASC) WITH (FILLFACTOR = 90)
);

