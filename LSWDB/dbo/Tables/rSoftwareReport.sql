CREATE TABLE [dbo].[rSoftwareReport] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [Parent]              NVARCHAR (255) NULL,
    [Custom1]             NVARCHAR (255) NULL,
    [LicenseOwner]        NVARCHAR (255) NULL,
    [softwareName]        NVARCHAR (255) NULL,
    [reqLicNumber]        INT            NULL,
    [isRequired]          NVARCHAR (20)  DEFAULT (N'ДА') NULL,
    [sku]                 NVARCHAR (255) NULL,
    [recNomencl]          NVARCHAR (255) NULL,
    [recNumLic]           INT            DEFAULT ((1)) NULL,
    [Custom11]            NVARCHAR (255) NULL,
    [AssetName]           NVARCHAR (255) NULL,
    [AssetID]             INT            NULL,
    [Statename]           NVARCHAR (255) NULL,
    [Custom19]            NVARCHAR (255) NULL,
    [keycomp]             NVARCHAR (255) NULL,
    [rr]                  INT            NULL,
    [LicenseTypeName]     NVARCHAR (255) NULL,
    [LicenseTypeComments] NVARCHAR (255) NULL,
    [Price]               FLOAT (53)     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

