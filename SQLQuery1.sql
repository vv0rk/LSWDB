use lansweeperdb;

	declare @typename nvarchar(50) = null;
	declare @ostype nvarchar(50) = null;
	declare @model nvarchar(50) = null;
	declare @modelmfu nvarchar(50) = null;
	declare @memory float = null;
	declare @cpu nvarchar(50) = null;
	declare @ret nvarchar(255) = null;
	declare @assetid int = 15481;

		select @typename = dt.AssetTypename, @ostype = dt.Caption, @model = dt.Model, @memory = dt.Memory, @cpu = dt.CPU, @modelmfu = dt.Custom9
			From (
				Select 
  					tblAssets.AssetID As AssetId,
					tsysAssetTypes.AssetTypename,
					os.Caption, 
					CASE
					WHEN tblProcessor.Name is not null then 
						CASE
							WHEN PATINDEX('%[0-9].[0-9.][0-9.]GHz', tblProcessor.Name ) > 2 then REPLACE(REPLACE(REPLACE(LEFT( tblProcessor.Name, PATINDEX('%[0-9].[0-9.][0-9.]GHz', tblProcessor.Name ) - 1), N'Intel ', N''), N' CPU', N''), N'@ ', N'')
						END
					END as CPU,
					convert(float, tblAssets.Memory / 1024) as Memory,
					tblAssetCustom.Model,
					tblAssetCustom.Custom9 
				From tblAssets
				  inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
				  inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
				  left Join tblState On tblState.State = tblAssetCustom.State
				  left Join tblOperatingsystem As os On dbo.tblAssetCustom.AssetID = os.AssetID
				  left Join tblProcessor On tblAssets.AssetID = tblProcessor.AssetID ) as dt
			where dt.AssetID = @AssetId


		IF @typename like 'windows' 
			begin 
				IF @ostype like N'%server%'
					begin
						Set @typename = N'Сервер'
					end
				ELSE 
					begin
						Set @typename = N'Компьютер'
					end
			end
		
		IF @typename like 'monitor'
			begin
				Set @typename = N'Монитор'
			end

		IF @typename like 'printer'
			begin
				Set @typename = N'МФУ'
			end

		IF @typename like 'APC' or @typename like 'UPS'
			begin
				Set @typename = N'ИБП'
			end

		Set @ret = @typename

		IF @model is not null and @typename like N'МФУ'
			begin 
				Set @ret = @ret + ' ' + @modelmfu 
			end

		IF @model is not null and @typename not like N'МФУ'
			begin 
				Set @ret = @ret + ' ' + @model 
			end
		IF @cpu is not null 
			begin
				Set @ret = @ret +  N', '+ @cpu 
			end
		IF @memory is not null
			begin
				Set @ret = @ret + N'/ ' + convert(nvarchar(10), @memory) + N'ГБ'
			end

	print @ret;
