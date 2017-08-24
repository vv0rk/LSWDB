CREATE TABLE [dbo].[tsysreports] (
    [Reportquery] NVARCHAR (200)  NOT NULL,
    [Reporttitle] NVARCHAR (1000) NOT NULL,
    [Sendmail]    BIT             NULL,
    [Mailgroup]   NVARCHAR (250)  NULL,
    [Created]     DATETIME        NULL,
    [LastChanged] DATETIME        NULL,
    [CreatedBy]   NVARCHAR (150)  NULL,
    [ChangedBy]   NVARCHAR (150)  NULL,
    [LastRun]     DATETIME        NULL,
    [Permissions] NVARCHAR (1000) NULL,
    [Total]       INT             NULL,
    [AlertType]   BIT             NULL,
    [ExportType]  INT             NULL,
    [Overwrite]   BIT             NULL,
    [LastAlert]   DATETIME        NULL,
    [ExportError] NVARCHAR (250)  NULL,
    [SendNow]     BIT             NULL,
    [ErrorDate]   DATETIME        NULL,
    CONSTRAINT [PK_tsysreports] PRIMARY KEY CLUSTERED ([Reportquery] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysreports_Reporttitle]
    ON [dbo].[tsysreports]([Reporttitle] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tsysreports_6_932354536__K1_2_12]
    ON [dbo].[tsysreports]([Reportquery] ASC) WITH (FILLFACTOR = 90);

