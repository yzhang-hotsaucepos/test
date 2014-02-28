USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetGoogleChartDataOneStore]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Rpt_GetGoogleChartDataOneStore]
(
	@Storeid int,
	@Type nvarchar(20)
)
as
declare @DeptStr nvarchar(2000)
declare @RevenueCenterStr nvarchar(2000)
declare @MealPeriodStr nvarchar(2000)
declare @paymentTypeStr nvarchar(2000)
declare @sqlAll nvarchar(max)
declare @Count int
select @DeptStr=dbo.fn_GetAllDepartment(@Storeid)
select @RevenueCenterStr = dbo.fn_GetRevenueCenter(@Storeid)
select @MealPeriodStr=dbo.fn_GetMealPeriod(@storeID)
select @paymentTypeStr=dbo.fn_GetPaymentName(@Storeid)
select @Count=COUNT(*) from FoundationMessageLog where StoreID in (select * from dbo.f_split(@Storeid,',')) and IsCalculating=1
set @sqlAll=''
if ISNULL(@Type,'')='MONTH' or ISNULL(@Type,'')='DAY'
begin
if @Count>0
begin
	--GrossSalesByDepartment
	set @sqlAll='
	select * from (select Department,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByDeptOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.GrossSales) for a.Department in ('+@DeptStr+')) b order by BusinessDate'

	--GrossSalesByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByProfitCenterOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.GrossSales) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	--GrossSalesByMealPriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''') 
	a pivot (sum(a.GrossSales) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--VoidCompDiscont
	set @sqlAll= @sqlAll+' select * from (select Period,AdjustedValue,BusinessDate,RecordType from GoogleChartVoidCompDiscontOld  where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''' )  
	a pivot (sum(a.AdjustedValue) for a.RecordType in (VOID,Comp,Discount)) b order by BusinessDate'

	--SalesByPaymentType
	set @sqlAll= @sqlAll+' select * from (select Payment,Period,Sales,BusinessDate from GoogleChartSaleByPaymentTypeAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.Sales) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate'

	--NumberByPaymentType
	set @sqlAll= @sqlAll+' select * from (select Payment,Period,NumPayment,BusinessDate from GoogleChartNumberByPaymentTypeAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumPayment) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate'

	--GuestSummaryByPeriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--GuestSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByProfitCenterAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	--TableSummaryByPeriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,NumTables,BusinessDate from GoogleChartTableSummaryByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumTables) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--TableSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,NumTables,BusinessDate from GoogleChartTableSummaryByProfitCenterAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumTables) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	end
	else
	begin
	--GrossSalesByDepartment
		set @sqlAll='
	select * from (select Department,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByDept where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.GrossSales) for a.Department in ('+@DeptStr+')) b order by BusinessDate'

	--GrossSalesByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByProfitCenter where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.GrossSales) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	--GrossSalesByMealPriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''') 
	a pivot (sum(a.GrossSales) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--VoidCompDiscont
	set @sqlAll= @sqlAll+' select * from (select Period,AdjustedValue,BusinessDate,RecordType from GoogleChartVoidCompDiscont  where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''' )  
	a pivot (sum(a.AdjustedValue) for a.RecordType in (VOID,Comp,Discount)) b order by BusinessDate'


	--SalesByPaymentType
	set @sqlAll= @sqlAll+' select * from (select Payment,Period,Sales,BusinessDate from GoogleChartSaleByPaymentTypeAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.Sales) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate'

	--NumberByPaymentType
	set @sqlAll= @sqlAll+' select * from (select Payment,Period,NumPayment,BusinessDate from GoogleChartNumberByPaymentTypeAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumPayment) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate'

	--GuestSummaryByPeriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--GuestSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByProfitCenterAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumGuest) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	--TableSummaryByPeriod
	set @sqlAll= @sqlAll+' select * from (select MealPriod,Period,NumTables,BusinessDate from GoogleChartTableSummaryByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumTables) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate'

	--TableSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select * from (select RevenueCenter,Period,NumTables,BusinessDate from GoogleChartTableSummaryByProfitCenterAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]='''+@Type+''')  
	a pivot (sum(a.NumTables) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate'

	end
end
else
begin
	if @Count>0
	begin
		--GrossSalesByDepartment
	set @sqlAll='
	select top 3 * from (select Department,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByDeptOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.GrossSales) for a.Department in ('+@DeptStr+')) b order by BusinessDate desc'

	--GrossSalesByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByProfitCenterOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.GrossSales) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	--GrossSalesByMealPriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'') 
	a pivot (sum(a.GrossSales) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--VoidCompDiscont
	set @sqlAll= @sqlAll+' select top 3 * from (select Period,AdjustedValue,BusinessDate,RecordType from GoogleChartVoidCompDiscontOld  where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'' )  
	a pivot (sum(a.AdjustedValue) for a.RecordType in (VOID,Comp,Discount)) b order by BusinessDate desc'

	--SalesByPaymentType
	set @sqlAll= @sqlAll+' select top 3 * from (select Payment,Period,Sales,BusinessDate from GoogleChartSaleByPaymentTypeAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.Sales) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate desc'

	--NumberByPaymentType
	set @sqlAll= @sqlAll+' select top 3 * from (select Payment,Period,NumPayment,BusinessDate from GoogleChartNumberByPaymentTypeAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumPayment) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate desc'

	--GuestSummaryByPeriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--GuestSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByProfitCenterAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	--TableSummaryByPeriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,NumTables,BusinessDate from GoogleChartTableSummaryByPeriodAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumTables) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--TableSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,NumTables,BusinessDate from GoogleChartTableSummaryByProfitCenterAllOld where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumTables) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	end
	else
	begin
	--GrossSalesByDepartment
		set @sqlAll='
	select top 3 * from (select Department,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByDept where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.GrossSales) for a.Department in ('+@DeptStr+')) b order by BusinessDate desc'

	--GrossSalesByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByProfitCenter where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.GrossSales) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	--GrossSalesByMealPriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,GrossSales,BusinessDate from GoogleChartGrossSalesByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'') 
	a pivot (sum(a.GrossSales) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--VoidCompDiscont
	set @sqlAll= @sqlAll+' select top 3 * from (select Period,AdjustedValue,BusinessDate,RecordType from GoogleChartVoidCompDiscont  where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'' )  
	a pivot (sum(a.AdjustedValue) for a.RecordType in (VOID,Comp,Discount)) b order by BusinessDate desc'


	--SalesByPaymentType
	set @sqlAll= @sqlAll+' select top 3 * from (select Payment,Period,Sales,BusinessDate from GoogleChartSaleByPaymentTypeAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.Sales) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate desc'

	--NumberByPaymentType
	set @sqlAll= @sqlAll+' select top 3 * from (select Payment,Period,NumPayment,BusinessDate from GoogleChartNumberByPaymentTypeAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumPayment) for a.Payment in ('+@paymentTypeStr+')) b order by BusinessDate desc'

	--GuestSummaryByPeriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--GuestSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,NumGuest,BusinessDate from GoogleChartGuestSummaryByProfitCenterAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumGuest) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	--TableSummaryByPeriod
	set @sqlAll= @sqlAll+' select top 3 * from (select MealPriod,Period,NumTables,BusinessDate from GoogleChartTableSummaryByPeriodAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumTables) for a.MealPriod in ('+@MealPeriodStr+')) b order by BusinessDate desc'

	--TableSummaryByProfitCenter
	set @sqlAll= @sqlAll+' select top 3 * from (select RevenueCenter,Period,NumTables,BusinessDate from GoogleChartTableSummaryByProfitCenterAll where StoreID in ('+convert(nvarchar(20),@Storeid)+') and [Type]=''MONTH'')  
	a pivot (sum(a.NumTables) for a.RevenueCenter in ('+@RevenueCenterStr+')) b order by BusinessDate desc'

	end
end
--select @sqlAll
execute sp_executesql @sqlAll
GO
