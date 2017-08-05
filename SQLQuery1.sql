use lansweeperdb;

go




exec sp_UpdateNorm @AssetId = 37359, @idMaterialOriginal = 8, @intence = 0.1



-- UPDATE dbo.rPrinterMaterialNorm SET dbo.rPrinterMaterialNorm.Intense = 0.5 Where dbo.rPrinterMaterialNorm.AssetId = 37359 and dbo.rPrinterMaterialNorm.idMaterialOriginal = 8
