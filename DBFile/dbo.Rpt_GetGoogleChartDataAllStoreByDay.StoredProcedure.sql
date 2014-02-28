USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetGoogleChartDataAllStoreByDay]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Rpt_GetGoogleChartDataAllStoreByDay]
(
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
)
as
declare @TimePeriodEnd datetime
select @TimePeriodEnd=dbo.[fn_GetDashboardTimePeriod](@storeID)
if CONVERT(datetime, CONVERT(nvarchar(20), GETDATE(),102))<=GETDATE() and getdate()<=CONVERT(datetime, CONVERT(nvarchar(20), GETDATE(),102))+@TimePeriodEnd
begin
	set @BeginDate=CONVERT(datetime, CONVERT(nvarchar(20),DATEADD(day,-1,getdate()),102))
	set @EndDate=CONVERT(datetime, CONVERT(nvarchar(20),DATEADD(day,-1,getdate()),102))
end
else
begin
	set @BeginDate=CONVERT(datetime, CONVERT(nvarchar(20),getdate(),102))
	set @EndDate=CONVERT(datetime, CONVERT(nvarchar(20),getdate(),102))
end
execute [Rpt_D_SalesByStoreByDay] @BeginDate,@EndDate,@storeID,1 --GorssSales
execute [Rpt_D_SalesByStoreByDay] @BeginDate,@EndDate,@storeID,2 --NetSales
execute [Rpt_D_VoidByStoreByDay] @BeginDate,@EndDate,@storeID --void
execute [Rpt_D_CompByStoreByDay] @BeginDate,@EndDate,@storeID --Comp
execute [Rpt_D_DiscountByStoreByDay] @BeginDate,@EndDate,@storeID --Discount
execute [Rpt_D_NumGuestSummaryByStoreByDay] @BeginDate,@EndDate,@storeID --NumGuest
execute [Rpt_D_NumTableSummaryByStoreByDay] @BeginDate,@EndDate,@storeID --NumTable
GO
