CREATE TABLE [dbo].[tsysMailgroups] (
    [Mailgroup]   NVARCHAR (250)  NOT NULL,
    [Members]     NVARCHAR (1000) NOT NULL,
    [MailgroupID] INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tsysmailgroups] PRIMARY KEY CLUSTERED ([MailgroupID] ASC) WITH (FILLFACTOR = 90)
);

