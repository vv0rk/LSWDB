/*
    Summary.

    Выполняется однократно при вводе в эксплуатацию новой редакции Инструкции по использованию Lansweeper
    устанавливает поле custom17 (Login) = Login. Для записей в которых совпадает Custom11 (ФИО пользователя) и Custom1 (Организация)
    сотрудник не уволен, ac.Custom17 (Login) не пустой и не ''
*/
use lansweeperdb; 

--with c as (
--select 
--	ac.AssetID
--	, c.Code
--	, c.Parent
--	, e.Org
--	, ac.Custom17 as login_tgt
--	, e.Login as login_src
--	from tblAssetCustom as ac
--	inner join rCompany$ as c on ac.Custom1 = c.Code
--	inner join fn_getEmployeeSplited() as e on ac.Custom11 = e.Name and c.Parent = e.Org
--	where e.removed = 0 and ac.Custom17 not like e.Login and (ac.custom17 is null or ac.custom17 like '')
--	) update c set
--login_tgt = login_src;

go

/*
    устанавливает ac.custom17 (login) = null, если rEmployee.Login = null (сотрудник уволен)
*/
--with c as (
--select 
--	ac.AssetID as Id
--    , ac.AssetID
--    , a.AssetName
--    , ac.Custom1 as Организация
--    , ac.Custom2 as Город
--    , ac.Custom3 as Адрес
--    , ac.Custom4 as Офис
--    , ac.custom11 as [ФИО пользователя]
--	, ac.Custom17 as [Login in Lansweeper]
--    , ac.Custom19 as [ФИО ВТшника]
--    , ac.Custom20 as [Обслуживающее подразделение]
    
--	from tblAssetCustom as ac
--    inner join tblAssets as a on ac.AssetID = a.AssetID
--	left join rEmployee as e on ac.Custom17 = e.login
--	where ac.custom17 is not null and e.login is null 
--	) update c set
--login_tgt = null;

-- обновляем ФИО пользователя, должность пользователя, Departament данными из rEmployee
-- поле login является ключем для связи.

with c as (
    select 
    ac.Custom17 as login_tgt
    , e.Login
    , ac.Custom11 as FIO_tgt
    , e.Name as FIO_src
    , ac.custom10 as JT_tgt
    , e.JobTitle as JT_src
    , ac.Department as Dep_tgt
    , e.Departament as Dep_src


    from tblAssetCustom as ac 
    inner join fn_getEmployeeSplited() as e on ac.Custom17 = e.login
    Where (ac.Custom17 is not null and ac.Custom17 not like '') and (ac.Custom17 like '%\%' and e.removed = 0) and
    (ac.Custom11 not like e.Name or ac.custom10 not like e.JobTitle or ac.Department not like e.Departament)
) update c set
FIO_tgt = FIO_src,
JT_tgt = JT_src,
Dep_tgt = Dep_src;


