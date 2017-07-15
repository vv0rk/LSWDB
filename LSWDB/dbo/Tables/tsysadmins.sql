CREATE TABLE [dbo].[tsysadmins] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [Domain]    NVARCHAR (150) NOT NULL,
    [AdminName] NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_tsysadmins] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

