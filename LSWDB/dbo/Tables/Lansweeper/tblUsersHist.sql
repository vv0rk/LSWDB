CREATE TABLE [dbo].[tblUsersHist] (
    [Trackercode]        INT            IDENTITY (1, 1) NOT NULL,
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
    [BuildInAdmin]       BIT            CONSTRAINT [DF_tblUsershist_BuildInAdmin] DEFAULT ((0)) NOT NULL,
    [Lastchanged]        DATETIME       CONSTRAINT [DF_tblUsershist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]             NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblUsershist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUsershist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblUsershist_tblAssets]
    ON [dbo].[tblUsersHist]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

