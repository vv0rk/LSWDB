CREATE FUNCTION [dbo].[fn_getSplitbit]
(
	@InputString nvarchar(max),
	@Delimiter nvarchar(max),
	@Number int
)
RETURNS nvarchar(max)
AS
BEGIN
declare @cnt int = 0
declare @bit nvarchar(max)
declare @r nvarchar(max) 

Set @r = @InputString

Set @cnt = 0

While @Number > @cnt
	begin
		IF charindex(@Delimiter, @r) = 0 
			BEGIN
				GOTO EX
			END

		--print @cnt
		Set @r = RIGHT(@r, LEN(@r) - charindex(@Delimiter, @r))
		--print charindex(@Delimiter, @r)
		--print @r
		set @cnt = @cnt + 1
	end
	--print '--------------------'
	if charindex(@Delimiter, @r) > 0 
		begin
			Set @bit = left(@r, charindex(@Delimiter, @r) - 1)
		end
	if charindex(@Delimiter, @r) = 0 
		begin
			Set @bit = @r
		end

EX:
return @bit
END
