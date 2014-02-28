USE [ClearHotsauceEnterprise]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetOrderMealPeriodRpt]    Script Date: 02/28/2014 15:54:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_GetOrderMealPeriodRpt]
(
	@openTime datetime,
	@storeID int
)
RETURNS nvarchar(50)
AS
BEGIN

	declare @dayofweek as nvarchar(50)
	declare @MealPeriodName nvarchar(50)
	set @dayofweek=case when DATEPART(WEEKDAY,@openTime)=1 then 'SUNDAY'
							when DATEPART(WEEKDAY,@openTime)=2 then 'MONDAY'
							when DATEPART(WEEKDAY,@openTime)=3 then 'TUESDAY'
							when DATEPART(WEEKDAY,@openTime)=4 then 'WEDNESDAY'
							when DATEPART(WEEKDAY,@openTime)=5 then 'THURSDAY'
							when DATEPART(WEEKDAY,@openTime)=6 then 'FRIDAY'
							when DATEPART(WEEKDAY,@openTime)=7 then 'SATURDAY' end 
	set @openTime='1900-01-01 '+Convert(Varchar(8),@openTime,108)
	set @MealPeriodName=''
	select @MealPeriodName=(select top 1 name from f_GetMealPeriodNameRpt(@storeID,@dayofweek) where @openTime between beginTime and endtime)
	return @MealPeriodName
END
GO
