USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetCashDepositTotals]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rpt_GetCashDepositTotals]
(
@beginDate datetime,
@endDate datetime,
@storeID nvarchar(200)
)
AS
begin
Declare @Sql as nvarchar(max)
SET NOCOUNT ON;
set @Sql=' SELECT isnull(sum(CashDeposit),0) as CashDeposit
FROM     CashDepsits    
where BusinessDate BETWEEN '''+ Convert(nvarchar,@BeginDate,120)+ ''' AND '''+ Convert(nvarchar,@EndDate,120) + '''
AND StoreID in ('+@storeID+')'
exec sp_executesql @sql
end
GO
