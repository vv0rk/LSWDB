CREATE TABLE [dbo].[tblQuickFixEngineeringUni] (
    [QFEID]               INT            IDENTITY (1, 1) NOT NULL,
    [Description]         NVARCHAR (450) NULL,
    [FixComments]         NVARCHAR (450) NULL,
    [HotFixID]            NVARCHAR (200) NULL,
    [ServicePackInEffect] NVARCHAR (300) NULL,
    [Hash]                VARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_tblQFEUnique] PRIMARY KEY CLUSTERED ([QFEID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblQuickFixEngineeringUni]
    ON [dbo].[tblQuickFixEngineeringUni]([Hash] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

