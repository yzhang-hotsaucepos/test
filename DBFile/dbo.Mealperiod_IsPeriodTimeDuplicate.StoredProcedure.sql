USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Mealperiod_IsPeriodTimeDuplicate]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Mealperiod_IsPeriodTimeDuplicate]
(
	@StoreID nvarchar(20),
	@BeginTime datetime,
	@EndTime datetime,
	@DayOfWeek nvarchar(20),
	@DayPartName nvarchar(50)
	
)
as
select * from [dbo].[f_GetMealPeriodRange](@BeginTime,@EndTime,@StoreID,@DayOfWeek,@DayPartName)
GO
