CREATE TABLE [dbo].[tblSafeguids] (
    [guid]   NVARCHAR (50)  NOT NULL,
    [Remark] NVARCHAR (400) NULL,
    CONSTRAINT [PK_tblSafeGuids] PRIMARY KEY CLUSTERED ([guid] ASC) WITH (FILLFACTOR = 90)
);

