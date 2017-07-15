CREATE TABLE [dbo].[htblticketssummaryfilter] (
    [summaryid]   INT NOT NULL,
    [filterid]    INT NOT NULL,
    [filterorder] INT NOT NULL,
    CONSTRAINT [PK_htblticketssummaryfilter] PRIMARY KEY CLUSTERED ([summaryid] ASC) WITH (FILLFACTOR = 90)
);

