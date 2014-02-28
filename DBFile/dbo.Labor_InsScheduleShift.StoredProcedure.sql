USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsScheduleShift]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_InsScheduleShift]
@ScheduleID int,
@JobID int,
@Weekly datetime,
@StoreID int
as 
 insert into LaborScheduleShift values(@ScheduleID,@JobID,@Weekly,@StoreID)
return @@IDENTITY
GO
