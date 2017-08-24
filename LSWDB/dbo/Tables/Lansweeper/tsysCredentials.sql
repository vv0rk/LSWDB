CREATE TABLE [dbo].[tsysCredentials] (
    [CredID]    INT             IDENTITY (1, 1) NOT NULL,
    [Credname]  NVARCHAR (100)  NOT NULL,
    [Username]  NVARCHAR (510)  NULL,
    [Password]  NVARCHAR (1000) NOT NULL,
    [Credtype]  INT             CONSTRAINT [DF_tsysDomainPasswords_isdomain] DEFAULT ((1)) NOT NULL,
    [Blank]     BIT             CONSTRAINT [DF_tsysCredentials_Blank] DEFAULT ((0)) NOT NULL,
    [Flags]     TINYINT         DEFAULT ((0)) NOT NULL,
    [Password2] NVARCHAR (1000) NULL,
    [GlobalKey] BIT             DEFAULT ((0)) NOT NULL,
    [SSHKey]    NTEXT           NULL,
    [KeyHash]   INT             NULL,
    CONSTRAINT [PK_tsysCredentials] PRIMARY KEY CLUSTERED ([CredID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tsysCredentials] UNIQUE NONCLUSTERED ([Credname] ASC) WITH (FILLFACTOR = 90)
);

