CREATE TABLE [dbo].[tblBootConfigurationUni] (
    [BootConfigurationuniid] INT            IDENTITY (1, 1) NOT NULL,
    [BootDirectory]          NVARCHAR (500) NULL,
    [Caption]                NVARCHAR (500) NULL,
    [ConfigurationPath]      NVARCHAR (500) NULL,
    [ScratchDirectory]       NVARCHAR (500) NULL,
    [TempDirectory]          NVARCHAR (500) NULL,
    [hash]                   VARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_tblBootConfigurationUni] PRIMARY KEY CLUSTERED ([BootConfigurationuniid] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblBootConfigurationUni]
    ON [dbo].[tblBootConfigurationUni]([hash] ASC) WITH (FILLFACTOR = 90);

