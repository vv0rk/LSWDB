CREATE TABLE [dbo].[tsysPackages] (
    [PackageID]      INT             IDENTITY (1, 1) NOT NULL,
    [PackageName]    NVARCHAR (255)  NOT NULL,
    [Description]    NVARCHAR (1000) NULL,
    [Created]        DATETIME        CONSTRAINT [DF_tsysPackages_Created] DEFAULT (getdate()) NOT NULL,
    [Lastchanged]    DATETIME        NULL,
    [Createdby]      NVARCHAR (255)  NULL,
    [Changedby]      NVARCHAR (255)  NULL,
    [Enabled]        BIT             CONSTRAINT [DF_tsysPackages_Enabled] DEFAULT ((1)) NOT NULL,
    [ShutdownOption] INT             NULL,
    [ShutdownTime]   INT             NULL,
    [Timeout]        INT             NOT NULL,
    [Rescan]         BIT             NOT NULL,
    [RunMode]        INT             DEFAULT ((-1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PackageID] ASC) WITH (FILLFACTOR = 90)
);

