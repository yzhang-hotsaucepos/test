USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[GetAllDept]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllDept]
(
	@StoreID int
)
as
select dbo.fn_GetAllDepartment(@StoreID)
GO
