﻿CREATE VIEW dbo.web50rep1f0da509baf14aa4b554e43dc650223a AS Select Top 1000000 a.AssetID As ID, a.AssetName, c.moddate, u.username, u.email, l.Description, c.Custom1_new, c.Custom1_old, c.Custom2_new, c.Custom2_old, c.Custom3_new, c.Custom3_old, c.Custom4_new, c.Custom4_old, c.Custom5_new, c.Custom5_old, c.Custom6_new, c.Custom6_old, c.Custom7_new, c.Custom7_old, c.Custom8_new, c.Custom8_old, c.Custom9_new, c.Custom9_old, c.Custom10_new, c.Custom10_old, c.Custom11_new, c.Custom11_old, c.Custom12_new, c.Custom12_old, c.Custom13_new, c.Custom13_old, c.Custom14_new, c.Custom14_old, c.Custom15_new, c.Custom15_old, c.Custom16_new, c.Custom16_old, c.Custom17_new, c.Custom17_old, c.Custom18_new, c.Custom18_old, c.Custom19_new, c.Custom19_old, c.Custom20_new, c.Custom20_old, l.LogID From rCustomsLog As c Inner Join tblAssets As a On c.AssetID = a.AssetID Inner Join tblConfigLog As l On DateAdd(minute, 1, c.moddate) > l.Date And DateAdd(minute, -1, c.moddate) < l.Date Inner Join htblusers As u On l.UserID = u.userid