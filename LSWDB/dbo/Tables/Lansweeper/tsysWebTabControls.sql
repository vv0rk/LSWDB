CREATE TABLE [dbo].[tsysWebTabControls] (
    [TabControlID] INT   IDENTITY (1, 1) NOT NULL,
    [TabID]        INT   NOT NULL,
    [ControlID]    INT   NOT NULL,
    [RowID]        INT   NOT NULL,
    [ColumnID]     INT   NOT NULL,
    [State]        NTEXT NULL,
    CONSTRAINT [PK_tsysWebTabControls] PRIMARY KEY CLUSTERED ([TabControlID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tsysWebTabControls_tsysWebControls] FOREIGN KEY ([ControlID]) REFERENCES [dbo].[tsysWebControls] ([ControlID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tsysWebTabControls_tsysWebTabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[tsysWebTabs] ([TabID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysWebTabControls_tsysWebControls]
    ON [dbo].[tsysWebTabControls]([ControlID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysWebTabControls_tsysWebTabs]
    ON [dbo].[tsysWebTabControls]([TabID] ASC) WITH (FILLFACTOR = 90);

