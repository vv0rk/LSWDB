CREATE TABLE [dbo].[htblwebroles] (
    [webroleid]   INT             NOT NULL,
    [description] NVARCHAR (4000) NULL,
    [authmembers] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_htblwebroles] PRIMARY KEY CLUSTERED ([webroleid] ASC) WITH (FILLFACTOR = 90)
);

