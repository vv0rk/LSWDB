CREATE TABLE [dbo].[htblassignexclusions] (
    [assignexclusionid] INT IDENTITY (1, 1) NOT NULL,
    [type]              INT NOT NULL,
    [typeid]            INT NOT NULL,
    CONSTRAINT [PK_htblassignexclusions] PRIMARY KEY CLUSTERED ([assignexclusionid] ASC) WITH (FILLFACTOR = 90)
);

