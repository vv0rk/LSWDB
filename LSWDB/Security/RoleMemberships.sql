ALTER ROLE [db_owner] ADD MEMBER [lansweeperuser];


GO
ALTER ROLE [db_owner] ADD MEMBER [IE\perlovskii];


GO
ALTER ROLE [db_datareader] ADD MEMBER [IE\savinnv];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ie\VT_USERS];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ie\UIT_USERS];


GO
ALTER ROLE [db_datareader] ADD MEMBER [IE\UIT_USERS_VR];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [IE\savinnv];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [TEST1\admin];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [TEST1\nikky];


GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [TEST1\debug];

