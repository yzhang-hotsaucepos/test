USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Company_InUpDel]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Company_InUpDel]
	@ShowRolesDesc bit
as 
update Company set ShowRolesDesc=@ShowRolesDesc
select @@ERROR
GO
