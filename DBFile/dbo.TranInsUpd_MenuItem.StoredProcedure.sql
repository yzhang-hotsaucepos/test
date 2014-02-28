USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_MenuItem]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TranInsUpd_MenuItem]
@StoreID int,
@ID int ,
@Name nvarchar(50),
@Category nvarchar(50),
@Department nvarchar(50),
@Price money,
@IsModifier bit,
@MIType varchar(10),
@ReportName  nvarchar(50),
@Cost money
AS
BEGIN
 UPDATE MenuItem SET Name = @Name,Category=@Category ,Department=@Department,Price=@Price,IsModifier=@IsModifier,LastUpdate = getDate(),MIType=@MIType ,Cost=@Cost,[status]='Normal'
 WHERE StoreID = @StoreID and ID = @ID
 if(@@rowcount=0)
 INSERT INTO MenuItem (StoreID,ID,Name,Category,Department,Price,IsModifier,ReportName,MIType,cost,LastUpdate,ReportCategory,ReportDepartment,[status])
	 VALUES(@StoreID, @ID, @Name,@Category,@Department,@Price,@IsModifier,@Name, @MIType,@cost,getDate(),@Category,@Department,'Normal')
END
GO
