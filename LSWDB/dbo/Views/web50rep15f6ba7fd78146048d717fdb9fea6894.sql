﻿CREATE VIEW dbo.web50rep15f6ba7fd78146048d717fdb9fea6894 AS Select Top 1000000 SU.SoftID, SU.SoftwarePublisher As Производитель, SU.softwareName As [Название ПО], Count(S.AssetID) As [Кол-во установок], SU.Approved As Одобрено, Case When Count(SL.softwareName) > 0 Then 1 Else 0 End As Лицензии From tblSoftwareUni As SU Inner Join tblSoftware As S On SU.SoftID = S.softID Left Join tblSublicenses As SL On SU.softwareName = SL.softwareName And S.softwareVersion = SL.softwareVersion Group By SU.SoftID, SU.SoftwarePublisher, SU.softwareName, SU.Approved Order By Производитель, [Название ПО]