USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_getStoreIDByTask]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_getStoreIDByTask]
(
	@taskID int
)
as
select distinct AssignedStoreID StoreID from TaskDetail  where TaskID=@taskID
and AssignedStoreID>0 and Enable=1
GO
