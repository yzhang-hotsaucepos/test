USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_ConstTable]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_ConstTable]
	@category nvarchar(20)
	
as
select id,Value,IsDefault,Describe from ConstTable where Category=@category
GO
