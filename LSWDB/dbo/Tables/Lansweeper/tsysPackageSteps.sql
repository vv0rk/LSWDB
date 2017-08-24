CREATE TABLE [dbo].[tsysPackageSteps] (
    [PackageStepID] INT             IDENTITY (1, 1) NOT NULL,
    [PackageID]     INT             NOT NULL,
    [StepNr]        INT             NULL,
    [StepType]      INT             NULL,
    [StepName]      NVARCHAR (255)  NULL,
    [OnSuccess]     INT             CONSTRAINT [DF_tsysPackageSteps_OnSuccess] DEFAULT ((-1)) NULL,
    [OnFailure]     INT             CONSTRAINT [DF_tsysPackageSteps_OnFailure] DEFAULT ((-1)) NULL,
    [Path]          NVARCHAR (4000) NULL,
    [Parameters]    NVARCHAR (1000) NULL,
    [Exitcodes]     NVARCHAR (255)  NULL,
    [Commandline]   NVARCHAR (1000) NULL,
    [MSIParameters] NVARCHAR (500)  NULL,
    [MSIName]       NVARCHAR (100)  NULL,
    [MSIVersion]    NVARCHAR (50)   NULL,
    [EditMode]      BIT             DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([PackageStepID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageSteps_tsysPackages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[tsysPackages] ([PackageID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tsysPackageSteps_tsysPackageStepTypes] FOREIGN KEY ([StepType]) REFERENCES [dbo].[tsysPackageStepTypes] ([StepType])
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSteps_tsysPackages]
    ON [dbo].[tsysPackageSteps]([PackageID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageSteps_tsysPackageStepTypes]
    ON [dbo].[tsysPackageSteps]([StepType] ASC) WITH (FILLFACTOR = 90);

