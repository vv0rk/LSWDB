/*
	Откат запланированного перемещения
*/
CREATE PROCEDURE [dbo].[sp_PlanOtkat]
	@id int = NULL
AS
	Declare @tgtId int = NULL;
	Declare @srcId int = NULL;
	declare @AssetId int = null;

	Select @tgtId = p.tgtId, @srcId = p.srcId, @AssetId = p.AssetId from rPlanTimeSheet as p where p.id = @id;

	IF @tgtId is not null
		begin
			delete dbo.rPlanTimeSheet where dbo.rPlanTimeSheet.id = @tgtId;
		end
	IF @srcId is not null
		begin 
			delete dbo.rPlanTimeSheet where dbo.rPlanTimeSheet.Id = @srcId
		end
	delete dbo.rPlanTimeSheet where dbo.rPlanTimeSheet.Id = @id;
	
	Delete dbo.tblAssets where dbo.tblAssets.AssetID = @AssetId
RETURN 0
