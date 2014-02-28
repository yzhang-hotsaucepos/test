USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_MealPeriod]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TranInsUpd_MealPeriod]
@StoreID int,
@ID int, 
@Name nvarchar(50),
@BeginTime datetime,
@EndTime datetime,
@DayOfWeek nvarchar(50)

AS 
BEGIN
 --UPDATE MealPeriod SET Name = @Name, BeginTime=@BeginTime,EndTime=@EndTime,[DayOfWeek]=@DayOfWeek, 
 --LastUpdate = getDate()
 --WHERE StoreID = @StoreID and ID = @ID
 --if(@@rowcount=0)
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'SUNDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'MONDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'TUESDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'WEDNESDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'THURSDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'FRIDAY', getDate())
 INSERT INTO MealPeriod (StoreID,Name,BeginTime,EndTime,[DayOfWeek],LastUpdate) 
 VALUES( @StoreID,@name,@BeginTime,@EndTime,'SATURDAY', getDate())
END
GO
