USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_SalesByPaymentByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Rpt_D_SalesByPaymentByDay]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
AS  
BEGIN
declare @sql nvarchar(max)
SET NOCOUNT ON;

set @sql='SELECT pm.Name as PaymentName, 
isnull(SUM(p.Amount),0) AS Sales
FROM  Payment AS p 
	INNER JOIN PaymentMethod AS pm ON p.MethodID = pm.Name AND pm.StoreID = p.StoreID 
	where p.BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and p.StoreID in ('+@storeID+')'
set @sql+=' GROUP BY pm.Name '

--select @sql
exec sp_executesql @sql
end
GO
