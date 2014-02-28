USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_InventoryCategoryAndItems_Sel]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Inv_InventoryCategoryAndItems_Sel]
as
select ID,[Description],CategoryID,0 IsCategory from Inv_Item where IsActive=1
union
select distinct ID,Name,ParentID,1 IsCategory from Inv_ItemCategory where IsActive=1
and ID in (select CategoryID from Inv_Item where IsActive=1)
GO
