USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetScheduleInfo]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GetScheduleInfo]
@ScheduleID int,
@Weekly datetime,
@StoreID int
as
 
begin
select * from LaborScheduleInfo where ScheduleID=@ScheduleID and Weekly=@Weekly and StoreId = @StoreID
end
GO
