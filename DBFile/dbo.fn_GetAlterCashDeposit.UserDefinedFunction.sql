USE [ClearHotsauceEnterprise]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAlterCashDeposit]    Script Date: 02/28/2014 15:54:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[fn_GetAlterCashDeposit]
(
	@BeginTime datetime,
	@endTime datetime,
	@StoreID int
)
RETURNS decimal(18,2)
AS
BEGIN
declare @CashDeposit decimal(18,2)
SELECT @CashDeposit=isnull(sum(CashDeposit),0) 
FROM     CashDepsits    
where BusinessDate BETWEEN @BeginTime   AND @endTime 
AND StoreID =@StoreID
return @CashDeposit
END
GO
