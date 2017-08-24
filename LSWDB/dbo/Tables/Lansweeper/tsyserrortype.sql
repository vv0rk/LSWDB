CREATE TABLE [dbo].[tsyserrortype] (
    [ErrorType] INT           NOT NULL,
    [Errorname] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_tsyserrortype] PRIMARY KEY CLUSTERED ([ErrorType] ASC) WITH (FILLFACTOR = 90)
);

