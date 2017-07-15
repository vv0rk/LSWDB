﻿CREATE VIEW dbo.web50rep0e413b366fe040a9a20c31d0157073c4 AS Select Top 1000000 at.AssetTypename As N'Тип устройства', ac.Custom1 As N'Организация', ac.Custom2 As N'Город', ac.Custom3 As 'Адрес', ac.Custom4 As 'Офис', ac.Model As 'Модель', ac.Serialnumber As 'Серийный №', ac.Custom7 As 'Инв. №', ac.Custom19 As 'Ответственный ВТшник', ac.Comments As 'Комментарий', a.Description As 'Назначение' From tblAssets As a Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType Inner Join tblState As s On ac.State = s.State Where s.Statename = 'In repair' Order By N'Тип устройства', N'Организация', N'Город', N'Адрес', N'Офис'