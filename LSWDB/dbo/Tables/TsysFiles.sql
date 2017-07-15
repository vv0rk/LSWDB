CREATE TABLE [dbo].[TsysFiles] (
    [VersionID]  INT             IDENTITY (1, 1) NOT NULL,
    [Searchfile] NVARCHAR (1000) NOT NULL,
    [Enabled]    BIT             CONSTRAINT [DF_TsysFiles_Enabled] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TsysFiles] PRIMARY KEY CLUSTERED ([VersionID] ASC) WITH (FILLFACTOR = 90)
);

