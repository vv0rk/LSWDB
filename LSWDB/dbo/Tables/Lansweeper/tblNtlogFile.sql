CREATE TABLE [dbo].[tblNtlogFile] (
    [LogfileID] INT            IDENTITY (1, 1) NOT NULL,
    [Logfile]   NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_tblntlogfile] PRIMARY KEY CLUSTERED ([LogfileID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblntlogfile] UNIQUE NONCLUSTERED ([Logfile] ASC) WITH (FILLFACTOR = 90)
);

