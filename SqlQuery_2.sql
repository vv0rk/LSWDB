﻿use lansweeperdb;

go

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,25/02/2017,>
/* Description:	<проверяет назначен ли AssetId к какому либо устройству из rActiveCategory1
				 если назначен, то удаление запрещено>
*/
-- =============================================
CREATE TRIGGER Trigger_tblAssets_rActiveCategory1
on [dbo].[tblAssets] FOR DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS (
				select * 
				from deleted as a
				inner join dbo.rAssetsImported as ac on a.AssetID = ac.AssetId
				)
	BEGIN
		RAISERROR (N'Этот Ассет связан с устройством rActiveCategory1 и запрещен к удалению',10,1)
		ROLLBACK TRANSACTION
	END


END
