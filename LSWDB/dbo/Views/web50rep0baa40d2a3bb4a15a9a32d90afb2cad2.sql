﻿CREATE VIEW dbo.web50rep0baa40d2a3bb4a15a9a32d90afb2cad2 AS SELECT TOP 1000000  cs.nrNom, cs.name, ma.PartNumber As N'Материал аналог', ma.Name As N'Материал аналог имя', mo.PartNumber As N'Материал оригинал', mo.Name As N'Материал оригинал имя' From r1CSprav As cs Left Join rMaterialAnalog As ma On cs.IdAnalog = ma.Id Left Join rMaterialLink As ml On ma.Id = ml.IdAnalog Left Join rMaterialOriginal As mo On ml.IdOriginal = mo.Id