USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_MenuItemByItemName]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_MenuItemByItemName]
(
	@StoreID nvarchar(200),
	@itemName nvarchar(50),
	@Category nvarchar(50),
	@Department nvarchar(50)
)
as
declare @sql nvarchar(max)
set @sql='
select  Name ,ID,Category,Department,ReportName,ReportCategory,ReportDepartment from MenuItem where StoreID in ('+@StoreID+') and ReportName='''+@itemName+''' and ReportCategory='''+@Category+''' and ReportDepartment='''+@Department+''''
--select @sql
execute sp_executesql @sql
GO
