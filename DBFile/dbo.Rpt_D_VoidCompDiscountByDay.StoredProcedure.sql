USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_VoidCompDiscountByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Rpt_D_VoidCompDiscountByDay]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
AS  
BEGIN
declare @sql nvarchar(max)
SET NOCOUNT ON;

set @sql='SELECT 
	SUM(isnull(OI.qty * OI.AdjustedPrice,0)) as AdjustedValue,
	oi.RecordType
	FROM OrderLineItem AS OI 
	INNER JOIN MenuItem AS MI ON OI.ItemID = MI.ID AND MI.ReportDepartment <> ''MODIFIER'' and OI.SI<>''N/A'' AND MI.StoreID = OI.StoreID
	inner join store as s on s.id=oi.storeID 
	WHERE MI.MIType NOT IN (''GC'', ''IHPYMNT'') and BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and oi.StoreID in ('+@storeID+') and RecordType in (''Void'',''COMP'',''Discount'')'
set @sql +=' GROUP BY oi.RecordType'

--select @sql
exec sp_executesql @sql
end
GO
