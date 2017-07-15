CREATE TABLE [dbo].[tsysPackageStepConditionNames] (
    [ConditionNameID] INT           NOT NULL,
    [ConditionName]   NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ConditionNameID] ASC) WITH (FILLFACTOR = 90)
);

