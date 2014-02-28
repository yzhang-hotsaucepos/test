USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_MenuItemRecipe_InUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inv_MenuItemRecipe_InUpDel]
(
	@InvMID int,
	@InvItemID int,
	@Qty decimal(18,2),
	@SQLOperationType nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@SQLOperationType='SQLINSERT')
		INSERT INTO Inv_MenuItemRecipe(InvMID,InvItemID,Qty)VALUES(@InvMID,@InvItemID,@Qty)				
	else if @SQLOperationType='SQLDELETE'
		DELETE FROM Inv_MenuItemRecipe WHERE InvMID=@InvMID
END
GO
