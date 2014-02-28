USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_MenuItem_InUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inv_MenuItem_InUpDel]
(
	@ID int,
	@Name nvarchar(200),
	@Price decimal(18,2),
	@RefNumber nvarchar(50),
	@CategoryID int,
	@IsEntree bit,
	@IsModifier bit,
	@IsActive bit,
	@Recipe nvarchar,
	@FromPOS bit,
	@Creator int,
	@Editor int,
	@SQLOperationType nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @MenuItemID int
	declare @CategoryName nvarchar(20)
	if(@SQLOperationType='SQLINSERT')
	begin
		select @CategoryName=name from Inv_MenuItemCategory where ID=@CategoryID
		select @MenuItemID = ID from Inv_MenuItem where CategoryID=@CategoryID and Name=@Name
		select Top 1 @IsModifier = IsModifier from MenuItem where Name=@Name and Category=@CategoryName
		if isnull(@MenuItemID,0)=0
		begin
			INSERT INTO Inv_MenuItem (Name,Price,RefNumber, CategoryID,IsEntree,IsModifier,IsActive,Recipe,FromPOS,LastUpdate,Creator,Editor)
			VALUES(@Name,@Price,@RefNumber,@CategoryID,@IsEntree,@IsModifier,@IsActive,@Recipe,@FromPOS,getdate(),@Creator,@Creator)
			set @MenuItemID=@@IDENTITY
		end
		select @MenuItemID
	end							
	else if @SQLOperationType='SQLUPDATE'
	begin
		 UPDATE Inv_MenuItem SET Name = @Name,Price=@Price,RefNumber=@RefNumber,CategoryID = @CategoryID,IsEntree = @IsEntree,IsModifier = @IsModifier,
		 IsActive = @IsActive,Recipe = @Recipe,FromPOS = @FromPOS,LastUpdate = getdate(),
		 Editor = @Editor
		 WHERE ID=@ID
	end
	else if @SQLOperationType='SQLDELETE'
	begin
		 UPDATE Inv_MenuItem SET IsActive = 0,LastUpdate = getdate(),Editor = @Editor
		 WHERE ID=@ID
	end
	else if @SQLOperationType='SQLDELETEPOS'
	begin
		DELETE FROM Inv_MenuItem WHERE FromPOS=@FromPOS
	end
	
END
GO
