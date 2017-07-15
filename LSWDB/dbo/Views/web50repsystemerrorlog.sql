
CREATE VIEW [dbo].[web50repsystemerrorlog]
AS
SELECT      TOP 1000 dbo.tsyserrors.Added, dbo.tsyserrortype.Errorname AS Type, dbo.tsyserrors.Errormsg AS Error, dbo.tsyserrors.Scanserver AS Server, 
                        CASE tsyserrors.errortype WHEN 5 THEN 'evinformationsm.png' ELSE 'everrorsm.png' END AS icon, dbo.tsysASServers.Version, 
                        dbo.tsysASServers.Servicestarted, dbo.tsysASServers.Servicelastpolled
FROM          dbo.tsysASServers INNER JOIN
                        dbo.tsyserrors INNER JOIN
                        dbo.tsyserrortype ON dbo.tsyserrors.Errortype = dbo.tsyserrortype.ErrorType ON dbo.tsysASServers.Servername = dbo.tsyserrors.Scanserver
ORDER BY dbo.tsyserrors.Errorid DESC