USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetGoogleChartDataAllStore]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Rpt_GetGoogleChartDataAllStore]
(
	@Storeid nvarchar(2000),
	@Type nvarchar(20)
)
as
declare @DeptStr nvarchar(2000)
declare @RevenueCenterStr nvarchar(2000)
declare @StoreNameStr nvarchar(2000)
declare @sqlAll nvarchar(max)
declare @Count int
select @DeptStr=dbo.fn_GetAllDepartment(@Storeid)
select @RevenueCenterStr = dbo.fn_GetRevenueCenter(@Storeid)
select @StoreNameStr = dbo.fn_GetStoreName(@Storeid)
select @Count=COUNT(*) from FoundationMessageLog where StoreID in (select * from dbo.f_split(@Storeid,',')) and IsCalculating=1

set @sqlAll=''
if ISNULL(@Type,'')='MONTH' or ISNULL(@Type,'')='DAY'
begin
	if @Count>0
	begin
	--GuestsummaryByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,NumGuest,BusinessDate from GoogleChartGuestsummaryByStoreAllOld b inner join Store s on b.storeID=s.ID 
	where StoreID in ('+@Storeid+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--GrossSalesByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALLOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]='''+@Type+''' and b.SalesType=''GROSSSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--NetSalesByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALLOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]='''+@Type+''' and b.SalesType=''NETSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'
	 
	--TableSummaryByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,NumTable,BusinessDate from GoogleChartTableSummaryByStoreAllOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and [Type]='''+@Type+''' )  
	a pivot (sum(a.NumTable) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Void
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''VOID'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Comp
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''COMP'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Discount
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''DISCOUNT'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	end
	else
	begin
	--GuestsummaryByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,NumGuest,BusinessDate from GoogleChartGuestsummaryByStoreAll b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--GrossSalesByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALL b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]='''+@Type+''' and b.SalesType=''GROSSSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--NetSalesByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALL b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]='''+@Type+''' and b.SalesType=''NETSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--TableSummaryByStore
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,NumTable,BusinessDate from GoogleChartTableSummaryByStoreAll b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and [Type]='''+@Type+''' )  
	a pivot (sum(a.NumTable) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Void
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''VOID'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Comp
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''COMP'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	--Discount
	set @sqlAll = @sqlAll +' select * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]='''+@Type+''' and b.recordType=''DISCOUNT'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate'

	end
end
else
begin
	if @Count>0
	begin
	--GuestsummaryByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,NumGuest,BusinessDate from GoogleChartGuestsummaryByStoreAllOld b inner join Store s on b.storeID=s.ID 
	where StoreID in ('+@Storeid+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--GrossSalesByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALLOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]=''MONTH'' and b.SalesType=''GROSSSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--NetSalesByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALLOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]=''MONTH'' and b.SalesType=''NETSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'
	 
	--TableSummaryByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,NumTable,BusinessDate from GoogleChartTableSummaryByStoreAllOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and [Type]=''MONTH'' )  
	a pivot (sum(a.NumTable) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Void
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''VOID'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Comp
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''COMP'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Discount
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscontOld b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''DISCOUNT'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	end
	else
	begin
	--GuestsummaryByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,NumGuest,BusinessDate from GoogleChartGuestsummaryByStoreAll b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--GrossSalesByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALL b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]=''MONTH'' and b.SalesType=''GROSSSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--NetSalesByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,sales,BusinessDate from GoogleChartSalesByStoreALL b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+') and
	[Type]=''MONTH'' and b.SalesType=''NETSALES'')  
	a pivot (sum(a.sales) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--TableSummaryByStore
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,NumTable,BusinessDate from GoogleChartTableSummaryByStoreAll b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and [Type]=''MONTH'' )  
	a pivot (sum(a.NumTable) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Void
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''VOID'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Comp
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''COMP'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	--Discount
	set @sqlAll = @sqlAll +' select top 3 * from (select s.StoreName,Period,AdjustedValue,BusinessDate from GoogleChartVoidCompDiscont b inner join Store s on b.storeID=s.ID where StoreID in ('+@Storeid+')  and
	[Type]=''MONTH'' and b.recordType=''DISCOUNT'')  
	a pivot (sum(a.AdjustedValue) for a.StoreName in ('+@StoreNameStr+')) b order by BusinessDate desc'

	end
end

--select @sqlAll
execute sp_executesql @sqlAll
GO
