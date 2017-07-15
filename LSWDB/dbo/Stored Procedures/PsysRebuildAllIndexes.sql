
CREATE procedure [dbo].[PsysRebuildAllIndexes]
AS DECLARE @TableName varchar(255) DECLARE TableCursor CURSOR FOR SELECT [name] FROM sysobjects WHERE xtype='U'  OPEN TableCursor FETCH NEXT
FROM          TableCursor
INTO             @TableName WHILE @@FETCH_STATUS = 0 BEGIN DBCC DBREINDEX(@TableName, ' ', 90) FETCH NEXT
FROM          TableCursor
INTO             @TableName END CLOSE TableCursor DEALLOCATE TableCursor