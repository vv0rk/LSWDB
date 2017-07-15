CREATE TABLE [dbo].[TsysMemorytypes] (
    [Memorytype] INT           NOT NULL,
    [MemoryName] VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_TsysMemoryTypes] PRIMARY KEY CLUSTERED ([Memorytype] ASC) WITH (FILLFACTOR = 90)
);

