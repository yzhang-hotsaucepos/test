USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_TaxCategory]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TranInsUpd_TaxCategory]
@StoreID int,
@ID int, 
@Category nvarchar(50), 
@Name nvarchar(50), 
@Rate decimal (18,4), 
@IsInclusive bit

AS
BEGIN
 --UPDATE TaxCategory SET Name = @Name,Rate = @Rate,IsInclusive=@IsInclusive, LastUpdate = getDate() WHERE StoreID = @StoreID and ID = @ID and Category = @Category
 --if(@@rowcount=0)
 INSERT INTO TaxCategory (StoreID,ID,Category,Name,Rate,IsInclusive,LastUpdate) VALUES( @StoreID,  @ID, @Category, @Name, @Rate, @IsInclusive, getDate())
END
GO
