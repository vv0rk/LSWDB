﻿CREATE VIEW dbo.web50repa11c3d0f6a17476aacf75536fd8923da AS Select Top 1000000 a.AssetID As Id, ac.Custom1 As 'Организация', ac.Custom2 As 'Город', ac.Custom3 As 'Адрес', ac.Custom4 As 'Офис', ac.Model As 'Модель устройства', a.AssetID, a.AssetName, ac.Serialnumber As 'Серийный номер', ac.Custom11 As 'ФИО пользователя', stt.Statename As 'Статус', j.Printed As 'Январь стр.', f.Printed As 'Феврать стр.', m.Printed As 'Март стр.', ap.Printed As 'Апрель стр.', ma.Printed As 'Май стр.', jun.Printed As 'Июнь стр.', july.Printed As 'Июль стр.', aug.Printed As 'Август стр.', s.Printed As 'Сентябрь стр.', o.Printed As 'Октябрь стр.', nov.Printed As 'Ноябрь стр.', december.Printed As 'Декабрь стр.' From tblAssets As a Inner Join tblAssetCustom As ac On a.AssetID = ac.AssetID Inner Join tsysAssetTypes As at On a.Assettype = at.AssetType Inner Join tblState As stt On ac.State = stt.State Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170101' And '20170131' Group By ph.AssetId) As j On a.AssetID = j.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170201' And '20170228' Group By ph.AssetId) As f On a.AssetID = f.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170301' And '20170331' Group By ph.AssetId) As m On a.AssetID = m.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170401' And '20170430' Group By ph.AssetId) As ap On a.AssetID = ap.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170501' And '20170531' Group By ph.AssetId) As ma On a.AssetID = ma.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170601' And '20170630' Group By ph.AssetId) As jun On a.AssetID = jun.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170701' And '20170731' Group By ph.AssetId) As july On a.AssetID = july.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20170801' And '20170831' Group By ph.AssetId) As aug On a.AssetID = aug.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20160901' And '20160930' Group By ph.AssetId) As s On a.AssetID = s.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20161001' And '20161031' Group By ph.AssetId) As o On a.AssetID = o.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20161101' And '20161130' Group By ph.AssetId) As nov On a.AssetID = nov.AssetId Left Join (Select ph.AssetId, Max(ph.printedpages) - Min(ph.printedpages) As Printed From rPrintHist As ph Where ph.datecheck Between '20161201' And '20161231' Group By ph.AssetId) As december On a.AssetID = december.AssetId Where stt.Statename Like '%ctive' And at.AssetTypename = 'Printer'