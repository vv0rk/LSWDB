/*
 вызывается периодически для установки привязки пользователя к ассету
 привязка пользователя устанавливается в соответствии полем Custom17 (login)
*/
CREATE PROCEDURE [dbo].[sp_setAssetUserRelation]
AS

-- удаляем записи в которых Relation установлено некорректно
delete from tblAssetUserRelations
from tblAssetUserRelations
inner join tblAssetCustom on tblAssetUserRelations.AssetID = tblAssetCustom.AssetID
where RIGHT(tblAssetCustom.custom17,LEN(tblAssetCustom.custom17) - CHARINDEX('\',tblAssetCustom.custom17)) <> tblAssetUserRelations.username OR
left(tblAssetCustom.custom17,CHARINDEX('\',tblAssetCustom.custom17)-1) <> tblAssetUserRelations.Userdomain

-- добавляем отношения. Работает
insert into tblAssetUserRelations (Username, Userdomain, AssetID, Type, StartDate)
select 
	RIGHT(ac.custom17,LEN(ac.custom17) - CHARINDEX('\',ac.custom17)) as username,
	left(ac.custom17,CHARINDEX('\',ac.custom17)-1) as userdomain,
	ac.AssetID,
	12,
	GETDATE()
from tblAssetCustom as ac 
inner join tblADusers as u on RIGHT(ac.custom17,LEN(ac.custom17) - CHARINDEX('\',ac.custom17)) = u.Username and left(ac.custom17,CHARINDEX('\',ac.custom17)-1) = u.Userdomain
left join tblAssetUserRelations as r on ac.AssetID = r.AssetID
where r.AssetID is null and (ac.Custom17 is not null and CHARINDEX('\',ac.custom17) > 0)


RETURN 0
