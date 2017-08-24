use lansweeperdb;



select 
	e.Org,
	e.Departament,
	e.JobTitle,
	e.Name,
	t.AssetTypename,
	ac.Model
	
from fn_getEmployee(default) as e
left join tblAssetCustom as ac on e.Name = ac.Custom11 
left join tblAssets as a on ac.AssetID = a.AssetID
left join tsysAssetTypes as t on a.Assettype = t.AssetType
left join tblState as s on ac.State = s.State
left join rCompany$ as c on ac.Custom1 = c.Code and e.Org = c.Parent
Where s.Statename like '%ctive%' or s.Statename like 'stock' or s.Statename like '%repai%' and e.removed = 0
Order by e.Departament, e.Name