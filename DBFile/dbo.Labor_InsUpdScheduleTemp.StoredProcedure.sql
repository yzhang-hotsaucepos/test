USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsUpdScheduleTemp]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_InsUpdScheduleTemp]
@ID int,
@ScheduleID int,
@Name nvarchar(500),
@Weekly datetime,
@StoreID int,
@UpdateTime datetime,
@Description nvarchar(500),
@type int
as
begin
if(@type = 0)
begin
insert into LaborScheduleTemp(ScheduleID,Name,Weekly,StoreID,UpdateTime,[Description]) values(@ScheduleID,@Name,@Weekly,@StoreID,@UpdateTime,@Description)
end
else if(@type = 1)
begin
delete from LaborScheduleTemp where ID = @ID
end
end
GO
