CREATE PROCEDURE [dbo].[sp_addNewRashod]
	@AssetId int = NULL,
	@idMaterialOriginal int = NULL,
	@Date datetime = NULL,
	@PrintedPages int = NULL,
	@Number int = 1,
	@idSclad int = NULL
AS
	declare @Org nvarchar(255) = null;
	declare @City nvarchar(255) = null;
	declare @Address nvarchar(255) = null;
	declare @Office nvarchar(255) = null;
	declare @type nvarchar(255) = null;
	declare @idRashod int = null;
	declare @username nvarchar(255) = null;
	

	Select @Org = ac.Custom1, @City = ac.Custom2, @Address = ac.Custom3, @Office = ac.Custom4, @type = t.AssetTypename
	from tblAssets as a
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	inner join tsysAssetTypes as t on a.Assettype = t.AssetType
	Where ac.AssetID = @AssetId;

	Select @username = SUSER_NAME();

	IF @AssetId is null or @idMaterialOriginal is null
		begin
			raiserror(N'AssetId и idMaterialOriginal должны быть определены',10000, 1);
			return 1;
		end
	IF @Date is null
		begin
			Set @Date = GETDATE();
		end

	INSERT into dbo.rMaterialRashod (AssetId, idMaterialOriginal, IdMaterialAnalog, [Date], Number, Username)
	VALUES (@AssetId, @idMaterialOriginal, 8000000, @Date, @Number, @username)
	Set @idRashod = @@IDENTITY;

	IF @type like N'Printer'
		begin
			IF @PrintedPages is null and @type like N'Printer'
			begin
				Select @PrintedPages = ac.Printedpages from tblAssetcustom as ac Where ac.AssetID = @AssetId
			end
			insert into dbo.rPrintHist (AssetId, Company, City, [Address], Officenr, datecheck, printedpages, IdMaterialRashod)
			values (@AssetId, @Org, @City, @Address, @Office, @Date, @PrintedPages, @idRashod)
		end

RETURN 0
