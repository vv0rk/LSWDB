CREATE TABLE [dbo].[tblUsers] (
    [UserID]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]            INT            NULL,
    [Accounttype]        NUMERIC (18)   NULL,
    [Disabled]           BIT            NULL,
    [Fullname]           NVARCHAR (450) NULL,
    [Lockout]            BIT            NULL,
    [Name]               NVARCHAR (300) NULL,
    [PasswordChangeable] BIT            NULL,
    [PasswordExpires]    BIT            NULL,
    [PasswordRequired]   BIT            NULL,
    [SID]                NVARCHAR (300) NULL,
    [Status]             NVARCHAR (50)  NULL,
    [Lastchanged]        DATETIME       CONSTRAINT [DF_tblUsers_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [BuildInAdmin]       BIT            CONSTRAINT [DF_tblUsers_BuildInAdmin] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED ([UserID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUsers_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblUsers_7_894834450__K14_K2_K7_2894]
    ON [dbo].[tblUsers]([BuildInAdmin] ASC, [AssetID] ASC, [Name] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblUsers_7_894834450__K2_K11_4364]
    ON [dbo].[tblUsers]([AssetID] ASC, [SID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

