USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[GetAllMealPeriod]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllMealPeriod]
(
	@StoreID int
)
as
select dbo.fn_GetMealPeriod(@StoreID)
GO
