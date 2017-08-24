CREATE TABLE [dbo].[tblADusers] (
    [Username]          NVARCHAR (150) NOT NULL,
    [Userdomain]        NVARCHAR (150) NOT NULL,
    [Firstname]         NVARCHAR (500) NULL,
    [Lastname]          NVARCHAR (500) NULL,
    [Name]              NVARCHAR (500) NULL,
    [Displayname]       NVARCHAR (500) NULL,
    [Description]       NVARCHAR (500) NULL,
    [Office]            NVARCHAR (500) NULL,
    [Telephone]         NVARCHAR (500) NULL,
    [Fax]               NVARCHAR (50)  NULL,
    [Mobile]            NVARCHAR (50)  NULL,
    [Street]            NVARCHAR (500) NULL,
    [City]              NVARCHAR (500) NULL,
    [C]                 NVARCHAR (300) NULL,
    [Zip]               NVARCHAR (300) NULL,
    [Country]           NVARCHAR (300) NULL,
    [Countrycode]       NVARCHAR (300) NULL,
    [UPN]               NVARCHAR (300) NULL,
    [Title]             NVARCHAR (500) NULL,
    [Department]        NVARCHAR (500) NULL,
    [Company]           NVARCHAR (500) NULL,
    [email]             NVARCHAR (300) NULL,
    [OU]                NVARCHAR (500) NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblADusers_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Picture]           IMAGE          NULL,
    [ADObjectID]        INT            NULL,
    [ManagerADObjectId] INT            NULL,
    [HomePhone]         NVARCHAR (50)  NULL,
    [Pager]             NVARCHAR (50)  NULL,
    [IpPhone]           NVARCHAR (50)  NULL,
    [State]             NVARCHAR (300) NULL,
    [HomePage]          NVARCHAR (300) NULL,
    [HomeDirectory]     NVARCHAR (500) NULL,
    [ProfilePath]       NVARCHAR (500) NULL,
    [LogonScript]       NVARCHAR (500) NULL,
    [whenCreated]       DATETIME       NULL,
    [whenChanged]       DATETIME       NULL,
    [EmployeeID]        NVARCHAR (50)  NULL,
    [EmployeeNumber]    NVARCHAR (50)  NULL,
    [EmployeeType]      NVARCHAR (50)  NULL,
    [Info]              NVARCHAR (500) NULL,
    [Division]          NVARCHAR (500) NULL,
    [ADUserID]          INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tblADusers] PRIMARY KEY CLUSTERED ([Username] ASC, [Userdomain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblADUsers_tblADObjects] FOREIGN KEY ([ADObjectID]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblADUsers_tblADObjects1] FOREIGN KEY ([ManagerADObjectId]) REFERENCES [dbo].[tblADObjects] ([ADObjectID])
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_19]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_2_3_4_6_20_21]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_2_6]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_20]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_8]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_9]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K1_K2_6]
    ON [dbo].[tblADusers]([Username] ASC, [Userdomain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_5_1868689855__K22_1]
    ON [dbo].[tblADusers]([email] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblADusers_7_1868689855__K2_23_9987]
    ON [dbo].[tblADusers]([Userdomain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADusers_OU]
    ON [dbo].[tblADusers]([OU] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADusers_Firstname]
    ON [dbo].[tblADusers]([Firstname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADusers_Lastname]
    ON [dbo].[tblADusers]([Lastname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADusers_Displayname]
    ON [dbo].[tblADusers]([Displayname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADusers_Username]
    ON [dbo].[tblADusers]([Username] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADUsers_tblADObjects]
    ON [dbo].[tblADusers]([ADObjectID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblADUsers_tblADObjects1]
    ON [dbo].[tblADusers]([ManagerADObjectId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

