CREATE TABLE [dbo].[htblhistorytypes] (
    [typeid] INT           NOT NULL,
    [name]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_htblhistorytypes] PRIMARY KEY CLUSTERED ([typeid] ASC) WITH (FILLFACTOR = 90)
);

