CREATE TABLE [dbo].[tsysantivirus] (
    [Software] NVARCHAR (300) NOT NULL,
    PRIMARY KEY CLUSTERED ([Software] ASC) WITH (FILLFACTOR = 90)
);

