USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_UpDelAttendanceStatuses]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Labor_UpDelAttendanceStatuses]
@ID int,
@Name nvarchar(50),
@type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if(@type = 0)
begin
insert into AttendanceStatuses values(@Name)
 
end
else if(@type = 1)
begin
 update AttendanceStatuses set name = @Name where ID = @ID

end
else if (@type = 2)
delete from AttendanceStatuses where ID = @ID
END
GO
