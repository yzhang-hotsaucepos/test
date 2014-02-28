USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_StoreByTaskID]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_StoreByTaskID]
(
	@taskID int
)
as
select  distinct StoreID,s.StoreName from TaskDetail t inner join EnterpriseUser e on t.AssignedUserID=e.ID
inner join Store s on s.ID=e.StoreID where  TaskID=@taskID and StoreID<>0
GO
