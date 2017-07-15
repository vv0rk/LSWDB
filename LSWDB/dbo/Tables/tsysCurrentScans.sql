CREATE TABLE [dbo].[tsysCurrentScans] (
    [ScanID]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [target]     NVARCHAR (150) NOT NULL,
    [Scanserver] NVARCHAR (60)  NOT NULL,
    [Priority]   BIT            CONSTRAINT [DF_tsysCurrentScans_Priority] DEFAULT ((0)) NOT NULL,
    [ScanType]   INT            NOT NULL,
    CONSTRAINT [PK_tsysCurrentScans] PRIMARY KEY CLUSTERED ([ScanID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysCurrentScans_tsysASServers] FOREIGN KEY ([Scanserver]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysCurrentScans_Scanserver]
    ON [dbo].[tsysCurrentScans]([Scanserver] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysCurrentScans_scantype]
    ON [dbo].[tsysCurrentScans]([ScanType] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysCurrentScans_target]
    ON [dbo].[tsysCurrentScans]([target] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_TsysCurrentscan_Scanserver_ScanType]
    ON [dbo].[tsysCurrentScans]([Scanserver] ASC, [ScanType] ASC)
    INCLUDE([ScanID], [Priority]) WITH (FILLFACTOR = 90);

