CREATE TABLE [dbo].[TsysWaittime] (
    [CFGCode]      INT          NOT NULL,
    [CFGname]      VARCHAR (20) NOT NULL,
    [Waitdays]     NUMERIC (18) NOT NULL,
    [Trackchanges] BIT          NULL,
    CONSTRAINT [PK_TsysWaittime] PRIMARY KEY CLUSTERED ([CFGCode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_TsysWaittime] UNIQUE NONCLUSTERED ([CFGname] ASC) WITH (FILLFACTOR = 90)
);

