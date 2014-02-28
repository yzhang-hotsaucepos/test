USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_PaidOut]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[TranInsUpd_PaidOut]
@StoreID int,
@ID int, 
@Name nvarchar(50)

AS
BEGIN
 UPDATE PaidOut SET Name = @Name,LastUpdate = getDate() WHERE StoreID = @StoreID and ID = @ID
 if(@@rowcount=0)
 INSERT INTO PaidOut(StoreID,ID,Name,LastUpdate) VALUES( @StoreID, @ID, @Name, getDate())
END
GO
