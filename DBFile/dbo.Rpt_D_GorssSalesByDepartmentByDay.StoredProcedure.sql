USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_GorssSalesByDepartmentByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Rpt_D_GorssSalesByDepartmentByDay]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
AS  
BEGIN
declare @sql nvarchar(max)
SET NOCOUNT ON;

set @sql='
SELECT MI.ReportDepartment as Department, 
		SUM(OI.Qty * OI.Price) AS GrossSales
		FROM OrderLineItem AS OI INNER JOIN [Order] AS O 
		ON OI.OrderID = O.ID AND O.StoreID = OI.StoreID AND O.BusinessDate = OI.BusinessDate 
		INNER JOIN MenuItem AS MI 
		ON OI.ItemID = MI.ID AND MI.ReportDepartment <> ''MODIFIER'' and OI.SI<>''N/A'' AND MI.StoreID = O.StoreID
WHERE MI.MIType NOT IN (''GC'', ''IHPYMNT'') and oi.BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and oi.StoreID in ('+@storeID+')'
set @sql +=' GROUP BY MI.ReportDepartment'

--select @sql
exec sp_executesql @sql
end
GO
