USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_VoidByStoreByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Rpt_D_VoidByStoreByDay]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
AS  
BEGIN
SET NOCOUNT ON;
declare @sql nvarchar(max)
set @sql='
 SELECT s.storeName as StoreName ,SUM(isnull(CASE OI.RecordType WHEN ''VOID'' THEN OI.qty * OI.AdjustedPrice END,0)) as Void 
    FROM OrderLineItem AS OI    INNER JOIN MenuItem AS MI ON OI.ItemID = MI.ID AND MI.ReportDepartment <> ''MODIFIER'' and OI.SI<>''N/A'' AND MI.StoreID = OI.StoreID   
    inner join store as s on s.id=oi.storeID    
	WHERE MI.MIType NOT IN (''GC'', ''IHPYMNT'') and BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and oi.StoreID in ('+@storeID+')'
set @sql +=' GROUP BY s.storeName '

--select @sql
exec sp_executesql @sql
end
GO
