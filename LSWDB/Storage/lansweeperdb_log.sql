ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [lansweeperdb_log], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\lansweeperdb_log.ldf', SIZE = 53248 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %);

