USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsAvailabilityTime]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Labor_InsAvailabilityTime]
	  @WeekDays nvarchar(50)
      ,@TimeScale nvarchar(50)
       ,@AvailabilityID int
AS
BEGIN
insert into LaborAvailabilityTime(WeekDays, TimeScale, AvailabilityID)
values(@WeekDays, @TimeScale, @AvailabilityID)
END
select @@IDENTITY
GO
