USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetAvailabilityByTime]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GetAvailabilityByTime]
@EmpID INT,
@StartTime datetime,
@EndTime datetime
as
begin

select * from LaborAvailability 
where(
    StartTime between @StartTime and @EndTime 
 or EndTime between @StartTime and @EndTime 
 or @StartTime between StartTime and EndTime 
 or @EndTime between StartTime and EndTime )
and EmpID = @EmpID
end
GO
