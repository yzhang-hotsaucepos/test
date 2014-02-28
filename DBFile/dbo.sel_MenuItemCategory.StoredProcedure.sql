USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_MenuItemCategory]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_MenuItemCategory]
(
	@storeID int
)
as
select distinct Department+'/'+Category as Category from MenuItem where StoreID=@storeID
GO
