/*
	Согласование плана перемещений
*/ 
CREATE PROCEDURE [dbo].[sp_PlanApprove]
	@id int = NULL
AS
	IF @id is null
		begin
			update dbo.rPlanTimeSheet 
			Set dbo.rPlanTimeSheet.isApproved = 1
			Where dbo.rPlanTimeSheet.isApproved = 0;
		end
	ELSE
		begin
			update dbo.rPlanTimeSheet 
			Set dbo.rPlanTimeSheet.isApproved = 1
			Where dbo.rPlanTimeSheet.id = @id;
		end
RETURN 0
