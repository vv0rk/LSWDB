CREATE TABLE [dbo].[tsysWebControls] (
    [ControlID]   INT             NOT NULL,
    [ControlName] NVARCHAR (255)  NULL,
    [Path]        NVARCHAR (1024) NULL,
    [Icon]        NVARCHAR (1024) CONSTRAINT [DF_tsysWebControls_Icon] DEFAULT ('/images/widget.png') NULL,
    [CanEdit]     BIT             CONSTRAINT [DF_tsysWebControls_CanEdit] DEFAULT ((0)) NOT NULL,
    [IsDefault]   BIT             CONSTRAINT [DF_tsysWebControls_IsDefault] DEFAULT ((0)) NOT NULL,
    [Preload]     BIT             DEFAULT ((0)) NOT NULL,
    [NoHelpdesk]  BIT             NULL,
    CONSTRAINT [PK_tsysWebControls] PRIMARY KEY CLUSTERED ([ControlID] ASC) WITH (FILLFACTOR = 90)
);

