USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_CategoryByDepartment]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_CategoryByDepartment]
(
	@storeID int,
	@Department nvarchar(20)
)
as
select distinct Department+'/'+Category as Category,Category as Categorys from MenuItem where StoreID=@storeID and Department=@Department
GO
