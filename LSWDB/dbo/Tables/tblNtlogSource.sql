CREATE TABLE [dbo].[tblNtlogSource] (
    [SourcenameID] INT            IDENTITY (1, 1) NOT NULL,
    [Sourcename]   NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_tblntlogsource] PRIMARY KEY CLUSTERED ([SourcenameID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [IX_tblntlogsource] UNIQUE NONCLUSTERED ([Sourcename] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

