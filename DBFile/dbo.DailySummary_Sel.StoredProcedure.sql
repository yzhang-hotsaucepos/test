USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[DailySummary_Sel]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DailySummary_Sel]
	@storeID int,
	@beginTime datetime,
	@endTime datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		-----DepartmentSales
		SELECT @storeID StoreID,[Department],'' [Category],'' Name,isnull(sum([GrossSales]),0) [GrossSales],isnull(sum([Voids]),0) [Voids],isnull(sum([Comps]),0) [Comps],isnull(sum([Discount]),0) [Discount] FROM [DailyDepartmentSales]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [Department]
		-----DailySummary_Tax
		SELECT @storeID StoreID,[Taxname],isnull(sum([TaxAmt]),0) [TaxAmt],isnull(sum([OrderAmt]),0) [OrderAmt] FROM [DailyTaxSummary]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [Taxname]
		-----Payment
		SELECT @storeID [StoreID],[PaymentName],isnull(sum([NumPayments]),0) numPayments,isnull(sum([Sales]),0) sales,isnull(sum([TipTotal]),0) [TipTotal],isnull(sum([TtlSrvCharge]),0) [TtlSrvCharge],isnull(sum([TtlReceived]),0) [TtlReceived] FROM [DailyPaymentSummary]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [PaymentName]
		-----CategoryByPeriod
		select [Category] [Category],isnull(SUM([TtlQty]),0) [TtlQty],isnull(sum(Dinner),0) Dinner,isnull(sum(Lunch),0) Lunch from	( SELECT [StoreID],[Category],[TtlQty],[AdjustedTotal],[MealPeriod],row_number() OVER (PARTITION BY StoreID ORDER BY StoreID) rowindex  FROM [DailyCategorySummaryByPeriod]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime
		) a pivot (sum(AdjustedTotal) for [MealPeriod] in (Dinner,Lunch)) b group by [Category]
		 ----CategoryByPC
	   SELECT @storeID [StoreID],[RevenueCenter],[Category] ReportCategory,isnull(sum([CatTotal]),0) [CatTotal] FROM [DailyCategorySummaryByPC]
	   where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [Category],[RevenueCenter]
		----VOID
	   SELECT @storeID [StoreID], 'VOID' [AdjustType],[AdjustName] AdjustedName,isnull(sum([Total]),0) [Total],isnull(sum([Count]),0) [count] FROM [DailyAdjustmentSummary]
	   where StoreID=@storeID and BusinessDate between  @beginTime and @endTime 
	   and AdjustType='VOID' group by [AdjustName]
	  ----COMP
	   SELECT @storeID [StoreID], 'COMP' [AdjustType],[AdjustName] AdjustedName,isnull(sum([Total]),0) [Total],isnull(sum([Count]),0) [count] FROM [DailyAdjustmentSummary]
	   where StoreID=@storeID and BusinessDate between  @beginTime and @endTime
	   and AdjustType='COMP' group by [AdjustName]
		----Discount
	   SELECT @storeID [StoreID],'DISCOUNT' [AdjustType],[AdjustName] AdjustedName,isnull(sum([Total]),0) [Total],isnull(sum([Count]),0) [count] FROM [DailyAdjustmentSummary]
	   where StoreID=@storeID and BusinessDate between  @beginTime and @endTime
	   and AdjustType='DISCOUNT' group by [AdjustName]
	   
		-----GuestTableByPC
		SELECT @storeID [StoreID],[RevenueCenterName],isnull(sum([NumTables]),0) [NumTables],isnull(sum([NumGuest]),0) [NumGuest],isnull(sum([NumChecks]),0) [NumChecks],isnull(sum([ProfitTotal]),0) [ProfitTotal] FROM [DailyGuestTableSummaryByPC]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [RevenueCenterName]
		-----GuestTableByPeriod
		SELECT [StoreID],[SaleGroup],[RecordType],isnull([Value],0) value,isnull([OrderCol],0) [OrderCol],[BusinessDate] FROM [DailyGuestTableSummaryByPeriod]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime 
		-----SaleDetails
		SELECT [StoreID],isnull(sum([GCSales]),0) [GCSales],isnull(sum([TotalPaidIn]),0) [TotalPaidIn],isnull(sum([InHousePaymentSales]),0) [InHousePaymentSales],isnull(sum([advPayment]),0)[advPayment],isnull(sum([surchageamt]),0) [surchageamt],isnull(sum([TotalPaidOut]),0) [TotalPaidOut],isnull(sum([PaidAdv]),0) [PaidAdv],isnull(sum([ReimbursementTtl]),0) [ReimbursementTtl],isnull(sum([Tipwithheld]),0) [Tipwithheld] ,isnull(sum([CashDeposit]),0) [CashDeposit],isnull(sum(GrossCash),0) GrossCash,isnull(sum(CCTipTtl),0) CCTipTtl,isnull(sum(TtlSrvCharge),0) TtlSrvCharge,isnull(sum(GCChangeTTL),0) GCChangeTTL,isnull(sum(NetCash),0) NetCash,isnull(sum(OtherPayments),0) OtherPayments,isnull(sum(CashOverShort),0) CashOverShort,isnull(sum(NetSaleTotal),0) NetSaleTotal,isnull(sum(TaxTotal),0) TaxTotal,isnull(sum(CashSrvChargeTTL),0) CashSrvChargeTTL FROM [DailySaleDetails]
		where StoreID=@storeID and BusinessDate between  @beginTime and @endTime group by [StoreID]
		
		--Return
	   SELECT @storeID [StoreID],'Return' [AdjustType],[AdjustName] AdjustedName,isnull(sum([Total]),0) [Total],isnull(sum([Count]),0) [count] FROM [DailyAdjustmentSummary]
	   where StoreID=@storeID and BusinessDate between  @beginTime and @endTime
	   and AdjustType='Return' group by [AdjustName]
	   
	   --IsShowReturn
	   select COUNT(*) from ConstTable where Category='Return' and Value='True' and ID=@storeID
END
GO
