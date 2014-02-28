USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[task_CheckIsCompleteAndUpdateStatus]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[task_CheckIsCompleteAndUpdateStatus]
(
	@taskID int
)
as
declare @count int
select @count=COUNT(*) from TaskDetail where TaskID=@taskID and Status=1
if @count=0
begin
	update Task set Status=2 where ID=@taskID
end
GO
