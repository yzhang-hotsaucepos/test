USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Sel_AllEnterpriseUser]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sel_AllEnterpriseUser]
as
select FirstName+','+LastName as UserName,'e-'+convert(nvarchar(20),ID) as UserID from EnterpriseUser where StoreID=0
GO
