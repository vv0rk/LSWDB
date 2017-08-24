CREATE TABLE [dbo].[tsysApiKeys] (
    [keyid]       INT            IDENTITY (1, 1) NOT NULL,
    [key]         NVARCHAR (200) NOT NULL,
    [description] NVARCHAR (150) NULL,
    CONSTRAINT [PK_tsysApiKeys] PRIMARY KEY CLUSTERED ([keyid] ASC) WITH (FILLFACTOR = 90)
);

