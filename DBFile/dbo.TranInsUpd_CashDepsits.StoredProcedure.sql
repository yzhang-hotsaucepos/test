USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_CashDepsits]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TranInsUpd_CashDepsits]
@StoreID int,
@ID int ,
@CashDeposit money,
@BusinessDate smalldatetime

AS
BEGIN try
 INSERT INTO CashDepsits (StoreID,ID,BusinessDate,CashDeposit,LastUpdate) VALUES( @StoreID, @ID, @BusinessDate, @CashDeposit, getDate())
END try
begin Catch
	if @@ERROR>0
	begin
		UPDATE CashDepsits SET BusinessDate = @BusinessDate,CashDeposit = @CashDeposit,LastUpdate = getDate() WHERE StoreID = @StoreID and ID = @ID
	end	
end Catch
GO
