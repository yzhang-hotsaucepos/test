USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Task_Iscomplete]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Task_Iscomplete]
(
	@StoreID int
)
as
select  COUNT(*) from TaskDetail t inner join EnterpriseUser  e on t.AssignedUserID=e.ID
where e.StoreID=@StoreID and t.Status=2
GO
