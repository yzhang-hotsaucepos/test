USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetMealPeriod]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Labor_GetMealPeriod]
@StoreID int 
as
begin
  select * from MealPeriod where StoreID =@StoreID
end
GO
