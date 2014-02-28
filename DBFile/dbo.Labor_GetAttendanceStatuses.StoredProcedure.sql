USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetAttendanceStatuses]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Labor_GetAttendanceStatuses]
@ID int,
@type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if(@type = 0)
begin
  select * from AttendanceStatuses
end
else if(@type = 1)
begin
select * from AttendanceStatuses where ID = @ID
end
END
GO
