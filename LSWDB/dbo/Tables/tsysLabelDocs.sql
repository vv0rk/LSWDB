CREATE TABLE [dbo].[tsysLabelDocs] (
    [ID]   INT       IDENTITY (1, 1) NOT NULL,
    [type] NCHAR (3) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

