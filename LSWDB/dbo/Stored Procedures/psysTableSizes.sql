
-- Lists Space Used for all user tables
CREATE procedure [dbo].[psysTableSizes]
AS
DECLARE @TableName VARCHAR(100)

DECLARE tableCursor CURSOR FORWARD_ONLY
FOR 
select [name]
from dbo.sysobjects 
where  OBJECTPROPERTY(id, N'IsUserTable') = 1
FOR READ ONLY

CREATE TABLE #TempTable
(
    tableName varchar(100),
    numberofRows varchar(100),
    reservedSize varchar(50),
    dataSize varchar(50),
    indexSize varchar(50),
    unusedSize varchar(50)
)

OPEN tableCursor

WHILE (1=1)
BEGIN
    FETCH NEXT FROM tableCursor INTO @TableName
    IF(@@FETCH_STATUS<>0)
      BREAK;

    INSERT  #TempTable
        EXEC sp_spaceused @TableName
END

CLOSE tableCursor
DEALLOCATE tableCursor

UPDATE #TempTable
SET reservedSize = REPLACE(reservedSize, ' KB', '')
, dataSize = REPLACE(dataSize, ' KB', '')
, indexSize = REPLACE(indexSize , ' KB', '')
, unusedSize = REPLACE(unusedSize , ' KB', '')

SELECT tableName 'Table Name',
numberofRows 'Total Rows',
reservedSize 'Reserved KB',
dataSize 'Data Size',
indexSize 'Index Size',
unusedSize 'Unused Size'
FROM #TempTable
ORDER BY CONVERT(bigint, dataSize)+CONVERT(bigint, indexSize) DESC

DROP TABLE #TempTable