USE [ClearHotsauceEnterprise]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetJobTitle]    Script Date: 02/28/2014 15:54:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetJobTitle]
 
 (
	@EmployeeID nvarchar(2000),
	@StoreID int
 )  
 
 RETURNS nvarchar(100)
 
 AS  
 
 BEGIN 
 	declare @JobName varchar(100)
               declare @retValue nvarchar(100)
               set @retValue=''
declare cur cursor
read_only
for select p.name from Position p inner join EmployeeJob j on p.ID=j.PositionID and p.StoreID=j.StoreID where j.EmployeeID=@EmployeeID and j.StoreID=@storeID

open cur
fetch next from cur into @JobName
while(@@fetch_status=0)

begin
	if ISNULL(@retValue,'')=''
	begin
	set @retValue=@retValue+@JobName
	end
	else
	begin
		set @retValue=@retValue+','+@JobName
	end
fetch next from cur into @JobName
end
close cur
deallocate cur
 
 	RETURN @retValue
 
 END
GO
