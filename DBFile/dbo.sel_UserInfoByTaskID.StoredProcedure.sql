USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_UserInfoByTaskID]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_UserInfoByTaskID]
(
	@taskID int
)
as
select eu.ID,eu.FirstName+' '+eu.LastName UserName,(select value from ConstTable as ct where ct.Category='TaskDetailState' and ct.ID=td.[Status]) as StatusValue from TaskDetail td inner join EnterpriseUser eu on  td.AssignedUserID=eu.ID where TaskID=@taskID and AssignedUserID in (select eu.ID
		from OrganizationToUser as otu inner join Organization as o on o.ID=otu.OrganizationID
		inner join EnterpriseUser as eu on otu.UserID=eu.ID
		where o.StoreID >0)
GO
