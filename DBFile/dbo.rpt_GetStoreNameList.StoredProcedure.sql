USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[rpt_GetStoreNameList]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[rpt_GetStoreNameList]
(
	@StoreIDlist nvarchar(2000)
)
as
select [dbo].[fn_GetStoreName](@StoreIDlist)
GO
