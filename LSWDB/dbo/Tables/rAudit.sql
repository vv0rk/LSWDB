CREATE TABLE [dbo].[rAudit] (
    [Type]       CHAR (1)        NULL,
    [TableName]  NVARCHAR (128)  NULL,
    [PK]         NVARCHAR (1000) NULL,
    [FieldName]  NVARCHAR (128)  NULL,
    [OldValue]   NVARCHAR (1000) NULL,
    [NewValue]   NVARCHAR (1000) NULL,
    [UpdateDate] DATETIME        NULL,
    [UserName]   NVARCHAR (128)  NULL
);

