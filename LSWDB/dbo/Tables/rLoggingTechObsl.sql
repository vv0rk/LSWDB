CREATE TABLE [dbo].[rLoggingTechObsl] (
    [AssetID]          BIGINT NOT NULL,
    [DatePlanTO]       DATE   NULL,
    [DateFactTO]       DATE   NULL,
    [DateOfChangePlan] DATE   NULL,
    [ApproveChange]    INT    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Журналирование плана технического обслуживания', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rLoggingTechObsl';

