USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_Coupon]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TranInsUpd_Coupon]
@StoreID int,
@ID int ,
@Name nvarchar(50)
AS
BEGIN
 --UPDATE Coupon SET Name = @Name,LastUpdate = getDate() WHERE StoreID = @StoreID and ID = @ID
 --if(@@rowcount=0)
 INSERT INTO Coupon VALUES(@StoreID, @ID, @Name,getDate())
END
GO
