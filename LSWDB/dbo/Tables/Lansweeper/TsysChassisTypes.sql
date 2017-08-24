CREATE TABLE [dbo].[TsysChassisTypes] (
    [Chassistype] INT           NOT NULL,
    [ChassisName] VARCHAR (255) NOT NULL,
    [img]         VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_TsysChassisTypes] PRIMARY KEY CLUSTERED ([Chassistype] ASC) WITH (FILLFACTOR = 90)
);

