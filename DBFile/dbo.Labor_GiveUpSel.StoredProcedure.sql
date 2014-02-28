USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GiveUpSel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GiveUpSel]

@userID int,
@StoreID int,
@SearchTime datetime,
@Type nvarchar(20)
as
begin
if(@Type = 'USER')
begin
  select distinct detail.*, pos.Name 'PositionName',pos.ID 'PositionID',schedule.ID 'ScheduleID',schedule.ScheduleName 'ScheduleName',users.ID 'UserID', users.FirstName,users.LastName from LaborScheduleShiftDetail as detail
  join LaborScheduleShift as shift  on detail.ShiftID = shift.ID
  join LaborScheduleInfo as info on shift.ScheduleID = info.ScheduleID and shift.Weekly = info.Weekly and info.IsPublic =1 and info.StoreId = shift.StoreID
  join LaborSchedule as schedule on schedule.ID = shift.ScheduleID
  join EmployeeJob as job on job.ID = shift.JobID and job.StoreID = shift.StoreID
  join Employee as users on users.ID=job.EmployeeID and users.StoreID = job.StoreID
  join Position as pos on job.PositionID = pos.ID and pos.StoreID = job.StoreID
  where users.ID =@userID or (detail.GiveUpFrom in (select Jobgiveup.ID from EmployeeJob Jobgiveup where Jobgiveup.EmployeeID = @userID and Jobgiveup.StoreID = @StoreID )or GiveUpFrom=0 and detail.IsGiveUp = 1) 
   and detail.BeginTime > @SearchTime and pos.StoreID = @StoreID
end
else if(@Type ='MANAGER')
begin
   select distinct detail.*, pos.Name 'PositionName',pos.ID 'PositionID',schedule.ID 'ScheduleID',schedule.ScheduleName 'ScheduleName',users.ID 'UserID', users.FirstName,users.LastName from LaborScheduleShiftDetail as detail
  join LaborScheduleShift as shift  on detail.ShiftID = shift.ID
  join LaborScheduleInfo as info on shift.ScheduleID = info.ScheduleID 
  join LaborSchedule as schedule on schedule.ID = shift.ScheduleID
  join EmployeeJob as job on job.ID = shift.JobID  and job.StoreID = shift.StoreID
  join Employee as users on users.ID=job.EmployeeID and users.StoreID = job.StoreID
  join Position as pos on job.PositionID = pos.ID and pos.StoreID = job.StoreID
  where detail.BeginTime > @SearchTime and pos.StoreID =@StoreID and ((IsGiveUp = 1 and GiveUpFrom = 0) or(IsGiveUp = 1 and GiveUpStatus =1))

 end
 end
GO
