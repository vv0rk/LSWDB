﻿

CREATE VIEW [web50replicenseexpiration60]
AS
SELECT        TOP 1000000 softwareName AS License, Priceperlicense, LicenseExpiration
FROM            tblLicenses
WHERE        (LicenseContract = 1) And DateDiff(day, GetDate(),tblLicenses.LicenseExpiration) <= 60
ORDER BY License