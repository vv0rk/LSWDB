CREATE TABLE [dbo].[tsysCustomFieldTypes] (
    [typeid]   INT           NOT NULL,
    [typename] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([typeid] ASC) WITH (FILLFACTOR = 90)
);

