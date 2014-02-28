USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[GetMealperiodCount]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMealperiodCount]
(
	@StoreId int
)
as
select COUNT(distinct name) from MealPeriod where StoreID=@StoreId
GO
