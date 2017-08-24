CREATE TABLE [dbo].[tsysPackageStepConditionTypes] (
    [ConditionTypeID] INT           NOT NULL,
    [TypeName]        NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionTypeID] ASC) WITH (FILLFACTOR = 90)
);

