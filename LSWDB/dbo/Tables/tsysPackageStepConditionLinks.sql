CREATE TABLE [dbo].[tsysPackageStepConditionLinks] (
    [ConditionLinkID] INT IDENTITY (1, 1) NOT NULL,
    [ConditionTypeID] INT NOT NULL,
    [ConditionNameID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionLinkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageStepConditionLink_tsysPackageStepConditionNames] FOREIGN KEY ([ConditionNameID]) REFERENCES [dbo].[tsysPackageStepConditionNames] ([ConditionNameID]),
    CONSTRAINT [FK_tsysPackageStepConditionLink_tsysPackageStepConditionTypes] FOREIGN KEY ([ConditionTypeID]) REFERENCES [dbo].[tsysPackageStepConditionTypes] ([ConditionTypeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageStepConditionLinks_tsysPackageStepConditionNames]
    ON [dbo].[tsysPackageStepConditionLinks]([ConditionNameID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageStepConditionLinks_tsysPackageStepConditionTypes]
    ON [dbo].[tsysPackageStepConditionLinks]([ConditionTypeID] ASC) WITH (FILLFACTOR = 90);

