USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Sel_StoreManagerByStoreID]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sel_StoreManagerByStoreID]
@StoreID int
as 
select FirstName+' '+LastName,ID from EnterpriseUser where StoreID=@StoreID and IsManager=1
GO
