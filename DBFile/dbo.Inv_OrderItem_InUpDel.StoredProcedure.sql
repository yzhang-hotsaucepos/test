USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_OrderItem_InUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inv_OrderItem_InUpDel]
	@OrderID int,
	@ItemID int,
	@ItemLineID int,
	@Qty decimal(18,2),
	@UnitPrice money ,
	@OrderUnitID int,
	@sqlType nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if ISNULL(@sqlType,'')='SQLINSERT'
    begin
		INSERT INTO Inv_OrderItem(OrderID,ItemID,ItemLineID,Qty,UnitPrice, OrderUnitID)
		VALUES (@OrderID,@ItemID,@ItemLineID,@Qty,@UnitPrice, @OrderUnitID)
	end
	else if ISNULL(@sqlType,'')='SQLDELETE'
		delete from Inv_OrderItem WHERE OrderID=@orderID 
END
GO
