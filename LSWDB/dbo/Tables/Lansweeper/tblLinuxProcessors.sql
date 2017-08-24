CREATE TABLE [dbo].[tblLinuxProcessors] (
    [ProcessorID]   INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [Socket]        NVARCHAR (200) NULL,
    [Type]          NVARCHAR (200) NULL,
    [Family]        NVARCHAR (200) NULL,
    [Manufacturer]  NVARCHAR (200) NULL,
    [ID]            NVARCHAR (200) NULL,
    [Version]       NVARCHAR (200) NULL,
    [Voltage]       NVARCHAR (200) NULL,
    [ExternalClock] NVARCHAR (200) NULL,
    [MaxSpeed]      NVARCHAR (200) NULL,
    [CurrentSpeed]  NVARCHAR (200) NULL,
    [Status]        NVARCHAR (200) NULL,
    [SerialNumber]  NVARCHAR (200) NULL,
    [LastChanged]   DATETIME       CONSTRAINT [DF_tblLinuxProcessors_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxProcessors] PRIMARY KEY CLUSTERED ([ProcessorID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxProcessors_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxProcessors_tblAssets]
    ON [dbo].[tblLinuxProcessors]([AssetID] ASC) WITH (FILLFACTOR = 90);

