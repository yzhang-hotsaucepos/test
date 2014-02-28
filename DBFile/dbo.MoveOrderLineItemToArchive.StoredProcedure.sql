USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[MoveOrderLineItemToArchive]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoveOrderLineItemToArchive]
AS
BEGIN
SET NOCOUNT ON;
declare @StoreID bigint 
declare @ID bigint 
declare @OrderID bigint 
declare @RecordType nvarchar(50) 
declare @ItemID int 
declare @Price money 
declare @Qty int 
declare @Seat nvarchar(50) 
declare @AdjustedPrice money 
declare @AdjustID int 
declare @EmployeeID int 
declare @TimeOrdered datetime 
declare @ParentSplitLineNum int 
declare @NumSplits smallint 
declare @SI nvarchar(3) 
declare @SIText nvarchar(50) 
declare @AsEntree char(1) 
declare @BusinessDate datetime 
declare @LastUpdate datetime 

declare cur cursor
	for SELECT StoreID,ID,OrderID,RecordType,ItemID,Price,Qty,Seat,AdjustedPrice,AdjustID,EmployeeID,TimeOrdered,ParentSplitLineNum,NumSplits,SI,SIText,AsEntree,BusinessDate,LastUpdate FROM OrderLineItem
	where CONVERT(varchar(10), BusinessDate, 120 )<DATEADD(YEAR,-2,CONVERT(varchar(10), GETDATE(), 120 ))
	open cur
	fetch next from cur into @StoreID,@ID,@OrderID,@RecordType,@ItemID,@Price,@Qty,@Seat,@AdjustedPrice,@AdjustID,@EmployeeID,@TimeOrdered,@ParentSplitLineNum,@NumSplits,@SI,@SIText,@AsEntree,@BusinessDate ,@LastUpdate 
	while(@@fetch_status=0)
	begin
		begin try
			UPDATE OrderLineItemArchive SET RecordType = @RecordType,ItemID = @ItemID,Price = @Price,Qty = @Qty,Seat = @Seat,AdjustedPrice = @AdjustedPrice,AdjustID = @AdjustID,EmployeeID = @EmployeeID,TimeOrdered = @TimeOrdered,ParentSplitLineNum = @ParentSplitLineNum,NumSplits = @NumSplits,SI = @SI,SIText = @SIText,AsEntree = @AsEntree,BusinessDate = @BusinessDate,LastUpdate = @LastUpdate
			WHERE  StoreID=@StoreID and ID=@ID and OrderID=@OrderID
			if @@ROWCOUNT=0
			INSERT INTO OrderLineItemArchive (StoreID,ID,OrderID,RecordType,ItemID,Price,Qty,Seat,AdjustedPrice,AdjustID,EmployeeID,TimeOrdered,ParentSplitLineNum,NumSplits,SI,SIText,AsEntree,BusinessDate,LastUpdate)
			VALUES (@StoreID,@ID,@OrderID  ,@RecordType,@ItemID    ,@Price,@Qty,@Seat,@AdjustedPrice,@AdjustID,@EmployeeID,@TimeOrdered,@ParentSplitLineNum,@NumSplits,@SI,@SIText,@AsEntree,@BusinessDate,@LastUpdate)
		END TRY
		BEGIN CATCH
		end  CATCH
		fetch next from cur into  @StoreID,@ID,@OrderID,@RecordType,@ItemID,@Price,@Qty,@Seat,@AdjustedPrice,@AdjustID,@EmployeeID,@TimeOrdered,@ParentSplitLineNum,@NumSplits,@SI,@SIText,@AsEntree,@BusinessDate ,@LastUpdate 
	end
close cur
deallocate cur
END
GO
