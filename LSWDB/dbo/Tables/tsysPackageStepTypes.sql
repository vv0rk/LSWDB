CREATE TABLE [dbo].[tsysPackageStepTypes] (
    [StepType]     INT           NOT NULL,
    [StepTypeName] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([StepType] ASC) WITH (FILLFACTOR = 90)
);

