USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsScheduleShiftDetails]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_InsScheduleShiftDetails]
@DetailID int,
@ShiftID int,
@BeginTime datetime,
@EndTime datetime,
@LunchBeginTime datetime,
@LunchEndTime datetime,
@DinnerBeginTime datetime,
@DinnerEndTime datetime,
@Description nvarchar(200),
@ColorName nvarchar(50),
@AttendanceID int,
@Status int
as 
if(@DetailID = 0)
begin
insert into LaborScheduleShiftDetail(
			ShiftID,
			BeginTime,
			EndTime,
			LunchBeginTime,
			LunchEndTime,
			DinnerBeginTime,
			DinnerEndTime,
			[Description],
			ColorName,
			AttendanceID,
			[Status]
			) 
		values
			(@ShiftID,
			@BeginTime,
			@EndTime,
			@LunchBeginTime,
			@LunchEndTime,
			@DinnerBeginTime,
			@DinnerEndTime,
			@Description,
			@ColorName,
			@AttendanceID,
			@Status
			)
		return @@IDENTITY 
	end
else
	begin
		update LaborScheduleShiftDetail set
		ShiftID = @ShiftID,
		BeginTime = @BeginTime,
		EndTime = @EndTime,
		LunchBeginTime =@LunchBeginTime,
		LunchEndTime =@LunchEndTime,
		DinnerBeginTime =@DinnerBeginTime,
		DinnerEndTime =@DinnerEndTime,
		[Description] =@Description,
		ColorName =@ColorName,
		AttendanceID =@AttendanceID,
		[Status] = @Status
		where ID = @DetailID
		return '0'
	end
GO
