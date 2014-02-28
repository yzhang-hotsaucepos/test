USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_MenuItemMap_InUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Inv_MenuItemMap_InUpDel]
(
	@StoreID int,
	@InvMID int,
	@stMID int,
	@SQLOperationType nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@SQLOperationType='SQLINSERT')
		INSERT INTO Inv_MenuItemMap(StoreID,InvMID,stMID)VALUES(@StoreID,@InvMID,@stMID)				
	else if @SQLOperationType='SQLDELETE'
		DELETE FROM Inv_MenuItemMap WHERE InvMID=@InvMID
END
GO
