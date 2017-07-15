ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [lansweeperdb], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\lansweeperdb.mdf', SIZE = 16886848 KB, FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];

