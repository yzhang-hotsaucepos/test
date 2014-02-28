USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[LoopingRebuildDailySummaryIndex]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[LoopingRebuildDailySummaryIndex]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
CREATE CLUSTERED INDEX [IX_DailyAdjustmentSummary] ON [dbo].[DailyAdjustmentSummary] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyCategorySummaryByPC] ON [dbo].[DailyCategorySummaryByPC] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyCategorySummaryByPeriod] ON [dbo].[DailyCategorySummaryByPeriod] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyDepartmentSales] ON [dbo].[DailyDepartmentSales] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyGuestTableSummaryByPC] ON [dbo].[DailyGuestTableSummaryByPC] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyGuestTableSummaryByPeriod] ON [dbo].[DailyGuestTableSummaryByPeriod] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyPaymentSummary] ON [dbo].[DailyPaymentSummary] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailySaleDetails] ON [dbo].[DailySaleDetails] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_DailyTaxSummary] ON [dbo].[DailyTaxSummary] 
(
	[StoreID] ASC,
	[BusinessDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = on, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


END
GO
