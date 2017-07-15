CREATE TABLE [dbo].[tblOperatingsystem] (
    [OSID]                                      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                                   INT            NOT NULL,
    [BuildType]                                 NVARCHAR (450) NULL,
    [Caption]                                   NVARCHAR (450) NULL,
    [Codeset]                                   NVARCHAR (50)  NULL,
    [Countrycode]                               NVARCHAR (50)  NULL,
    [Currenttimezone]                           NUMERIC (18)   NULL,
    [DataExecutionPrevention_32BitApplications] BIT            NULL,
    [DataExecutionPrevention_Available]         BIT            NULL,
    [DataExecutionPrevention_Drivers]           BIT            NULL,
    [DataExecutionPrevention_Supportpolicy]     NUMERIC (18)   NULL,
    [Debug]                                     BIT            NULL,
    [EncryptionLevel]                           NUMERIC (18)   NULL,
    [ForegroundApplicationBoost]                INT            NULL,
    [InstallDate]                               DATETIME       NULL,
    [LargeSystemCache]                          BIT            NULL,
    [MaxProcessMemorySize]                      NUMERIC (18)   NULL,
    [NumberOfLicensedUsers]                     NUMERIC (18)   NULL,
    [Organization]                              NVARCHAR (450) NULL,
    [OSLanguage]                                NUMERIC (18)   NULL,
    [OSProductSuite]                            NUMERIC (18)   NULL,
    [OSType]                                    NUMERIC (18)   NULL,
    [OtherTypeDescription]                      NVARCHAR (50)  NULL,
    [PlusProductID]                             NVARCHAR (50)  NULL,
    [PlusVersionNumber]                         NVARCHAR (50)  NULL,
    [ProductType]                               NUMERIC (18)   NULL,
    [RegisteredUser]                            NVARCHAR (450) NULL,
    [SerialNumber]                              NVARCHAR (50)  NULL,
    [ServicePackMajorVersion]                   NUMERIC (18)   NULL,
    [ServicePackMinorVersion]                   NUMERIC (18)   NULL,
    [SizeStoredInPagingFiles]                   NUMERIC (18)   NULL,
    [Suitemask]                                 NUMERIC (18)   NULL,
    [SystemDevice]                              NVARCHAR (450) NULL,
    [SystemDrive]                               NVARCHAR (50)  NULL,
    [TotalVirtualMemorysize]                    NUMERIC (18)   NULL,
    [TotalVisibleMemorySize]                    NUMERIC (18)   NULL,
    [Version]                                   NVARCHAR (50)  NULL,
    [WindowsDirectory]                          NVARCHAR (300) NULL,
    [Lastchanged]                               DATETIME       CONSTRAINT [DF_tblOperatingsystem_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblOperatingsystem] PRIMARY KEY CLUSTERED ([OSID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblOperatingsystem_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblOperatingsystem_8_629785501__K2]
    ON [dbo].[tblOperatingsystem]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblOperatingsystem_8_629785501__K2_4]
    ON [dbo].[tblOperatingsystem]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

