CREATE TABLE [dbo].[tsysPackageStepConditions] (
    [ConditionID]      INT             IDENTITY (1, 1) NOT NULL,
    [PackageStepID]    INT             NULL,
    [ConditionTypeID]  INT             NOT NULL,
    [SpecificationOne] NVARCHAR (1000) NULL,
    [SpecificationTwo] NVARCHAR (1000) NULL,
    [ConditionNameID]  INT             NULL,
    [Value]            NVARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([ConditionID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageStepConditions_tsysPackageStepConditionNames] FOREIGN KEY ([ConditionNameID]) REFERENCES [dbo].[tsysPackageStepConditionNames] ([ConditionNameID]),
    CONSTRAINT [FK_tsysPackageStepConditions_tsysPackageStepConditionTypes] FOREIGN KEY ([ConditionTypeID]) REFERENCES [dbo].[tsysPackageStepConditionTypes] ([ConditionTypeID]),
    CONSTRAINT [FK_tsysPackageStepConditions_tsysPackageSteps] FOREIGN KEY ([PackageStepID]) REFERENCES [dbo].[tsysPackageSteps] ([PackageStepID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageStepConditions_tsysPackageStepConditionTypes]
    ON [dbo].[tsysPackageStepConditions]([ConditionTypeID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageStepConditions_tsysPackageStepConditionNames]
    ON [dbo].[tsysPackageStepConditions]([ConditionNameID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageStepConditions_tsysPackageSteps]
    ON [dbo].[tsysPackageStepConditions]([PackageStepID] ASC) WITH (FILLFACTOR = 90);

