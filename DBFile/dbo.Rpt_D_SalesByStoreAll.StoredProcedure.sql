USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_SalesByStoreAll]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Rpt_D_SalesByStoreAll]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200),
	@ByYear char(1),
	@ByQuarter char(1),
	@ByWeek char(1),
	@SalesType int --1:GrossSales 2:NetSales
AS  
BEGIN
declare @sql nvarchar(max)
declare @selSql nvarchar(max)
declare @groupBySql nvarchar(max)
declare @joinTable nvarchar(max)
declare @colSql nvarchar(max)
declare @SalesTypeSql nvarchar(max)
declare @colName nvarchar(20)
SET NOCOUNT ON;
set @groupBySql=''
set @selSql=''
set @joinTable=''
set @SalesTypeSql=''
set @colName=''
if ISNULL(@ByYear,'')='Y'
begin
	set @groupBySql=@groupBySql+',datepart(m, OI.BusinessDate)'
	set @selSql=@selSql+',    case when datepart(m, OI.BusinessDate)=1 then ''Jan'' 
				when datepart(m, OI.BusinessDate)=2 then ''Feb'' 
				when datepart(m, OI.BusinessDate)=3 then ''March''
				when datepart(m, OI.BusinessDate)=4 then ''April''
				when datepart(m, OI.BusinessDate)=5 then ''May''
				when datepart(m, OI.BusinessDate)=6 then ''June''
				when datepart(m, OI.BusinessDate)=7 then ''July''
				when datepart(m, OI.BusinessDate)=8 then ''Aug''
				when datepart(m, OI.BusinessDate)=9 then ''Sep''
				when datepart(m, OI.BusinessDate)=10 then ''Oct''
				when datepart(m, OI.BusinessDate)=11 then ''Nov''
				when datepart(m, OI.BusinessDate)=12 then ''Dec'' end period ,datepart(m, OI.BusinessDate) peroidID'
	set @joinTable=@joinTable+' right join (select DATEPART(month, dateadd(month,number,'''+CONVERT(nvarchar(20),@begindate)+''')) Period
from master..spt_values
where type=''P'' and dateadd(month,number,'''+CONVERT(nvarchar(20),@begindate)+''')<='''+CONVERT(nvarchar(20),@EndDate)+''') t on t.Period=datepart(m, OI.BusinessDate) '
	
end
if ISNULL(@ByQuarter,'')='Y'
begin
	set @groupBySql=@groupBySql+',datepart(m, OI.BusinessDate)'
	set @selSql=@selSql+',    case when datepart(QUARTER, OI.BusinessDate)=1 then ''Spring'' 
				when datepart(QUARTER, OI.BusinessDate)=2 then ''Summer'' 
				when datepart(QUARTER, OI.BusinessDate)=3 then ''Autumn''
				when datepart(QUARTER, OI.BusinessDate)=4 then ''Winter'' end period ,datepart(QUARTER, OI.BusinessDate) peroidID'
	set @joinTable=@joinTable+' right join (select DATEPART(month, dateadd(month,number,'+CONVERT(nvarchar(20),@begindate)+')) Period
from master..spt_values
where type=''P'' and dateadd(month,number,'''+CONVERT(nvarchar(20),@begindate)+''')<='''+CONVERT(nvarchar(20),@EndDate)+''') t on t.Period=datepart(m, OI.BusinessDate) '
end
if ISNULL(@ByWeek,'')='Y'
begin
	set @groupBySql=@groupBySql+',datepart(WEEKDAY,OI.BusinessDate)'
	set @selSql=@selSql+',case when DATEPART(WEEKDAY,OI.BusinessDate)=1 then ''SUNDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=2 then ''MONDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=3 then ''TUESDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=4 then ''WEDNESDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=5 then ''THURSDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=6 then ''FRIDAY''
							when DATEPART(WEEKDAY,OI.BusinessDate)=7 then ''SATURDAY'' end period,datepart(WEEKDAY, OI.BusinessDate) peroidID'
	set @joinTable=@joinTable+' right join (select DATEPART(Day, dateadd(Day,number,'''+CONVERT(nvarchar(20),@begindate)+''')) Period
from master..spt_values
where type=''P'' and dateadd(Day,number,'''+CONVERT(nvarchar(20),@begindate)+''')<='''+CONVERT(nvarchar(20),@EndDate)+''') t on t.Period=datepart(d, OI.BusinessDate) '
end

if ISNULL( @SalesType,0)=1
begin
	set @SalesTypeSql=',SUM(OI.Qty * OI.Price) AS GrossSales '
	set @colName='GrossSales'
end
else if ISNULL( @SalesType,0)=2
begin
	set @SalesTypeSql=',SUM(OI.Qty * (OI.Price-OI.AdjustedPrice)) AS NetSales '
	set @colName='NetSales'
end

 select @colSql= dbo.fn_GetStoreName(@storeID)

set @sql='

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#tempOrderLineItem'') and type=''U'')  
drop table #tempOrderLineItem 
select * into #tempOrderLineItem from [dbo].[fnOrderLineItemTable]('''+ Convert(nvarchar,@BeginDate,120)+ ''','''+ Convert(nvarchar,@EndDate,120) + ''','''+@storeID+''')
select * from ( SELECT s.storeName as StoreName '+ @SalesTypeSql + @selSql+'
	FROM #tempOrderLineItem AS OI 
	INNER JOIN MenuItem AS MI ON OI.ItemID = MI.ID AND MI.ReportDepartment <> ''MODIFIER'' and OI.SI<>''N/A'' AND MI.StoreID = OI.StoreID
	inner join store as s on s.id=oi.storeID 
	'+@joinTable+'
	WHERE MI.MIType NOT IN (''GC'', ''IHPYMNT'') '
set @sql +=' GROUP BY s.storeName '+@groupBySql+' ) a pivot (sum('+@colName+') for StoreName in('+@colSql+')) b order by peroidID'



--select @sql
exec sp_executesql @sql
end
GO
