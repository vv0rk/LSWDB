CREATE TABLE [dbo].[tblDomainroles] (
    [Domainrole]     INT          NOT NULL,
    [Domainrolename] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tbldomainroles] PRIMARY KEY CLUSTERED ([Domainrole] ASC) WITH (FILLFACTOR = 90)
);

