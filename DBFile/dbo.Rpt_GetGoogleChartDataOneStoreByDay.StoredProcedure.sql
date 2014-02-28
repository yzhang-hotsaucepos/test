USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetGoogleChartDataOneStoreByDay]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Rpt_GetGoogleChartDataOneStoreByDay]
(
	@BeginDate datetime,
	@EndDate datetime,
	@storeID int
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
execute [Rpt_D_GorssSalesByDepartmentByDay] @BeginDate,@EndDate,@storeID --GorssSales By Dept
execute [Rpt_D_GorssSalesByPeriodByDay] @BeginDate,@EndDate,@storeID --GrossSales BY Period
execute [Rpt_D_GorssSalesByRcByDay] @BeginDate,@EndDate,@storeID --GrossSales BY RevenueCenter
execute [Rpt_D_VoidCompDiscountByDay] @BeginDate,@EndDate,@storeID --Void ,Comp,Discount
execute [Rpt_D_SalesByPaymentByDay] @BeginDate,@EndDate,@storeID --Sales By PaymentType
execute [Rpt_D_NumberByPaymentByDay] @BeginDate,@EndDate,@storeID --Number By PaymentType
execute [Rpt_D_NumGuestByPeriodByDay] @BeginDate,@EndDate,@storeID --NumGuest By Period
execute [Rpt_D_NumTableByPeriodByDay] @BeginDate,@EndDate,@storeID --NumTable By Period
execute [Rpt_D_NumGuestByRcByDay] @BeginDate,@EndDate,@storeID --NumGuest By RevenueCenter
execute [Rpt_D_NumTableByRcByDay] @BeginDate,@EndDate,@storeID --NumTable By RevenueCenter
GO
