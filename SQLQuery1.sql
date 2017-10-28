use lansweeperdb;

go

select 
ac.Custom11 as [ФИО пользователя]
, ac.Custom17 as login
, e.Name

, e.login
, *
from tblAssetCustom as ac
inner join fn_getEmployeeSplited() as e on ac.Custom11 = e.Name

where e.login not like ac.custom17