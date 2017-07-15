

CREATE VIEW [dbo].[web50replicenseexpired]
AS
SELECT     	TOP 1000000 softwareName AS License, Priceperlicense, LicenseExpiration
FROM       	tblLicenses
WHERE		LicenseContract = 1 AND DATEDIFF(day, LicenseExpiration, GETDATE()) >= 1
ORDER BY 	License
