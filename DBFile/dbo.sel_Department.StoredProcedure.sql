USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_Department]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_Department]
(
	@StoreId int
)
as
select distinct Department from MenuItem where StoreID=@storeID
GO
