USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[task_CheckIsAllComplete]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[task_CheckIsAllComplete]
(
	@taskID int
)
as
select COUNT(*) from TaskDetail where TaskID=@taskID and Status=1
GO
