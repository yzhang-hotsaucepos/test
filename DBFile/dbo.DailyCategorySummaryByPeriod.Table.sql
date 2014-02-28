USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyCategorySummaryByPeriod]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyCategorySummaryByPeriod](
	[StoreID] [int] NULL,
	[Category] [nvarchar](50) NULL,
	[TtlQty] [int] NULL,
	[AdjustedTotal] [decimal](18, 2) NULL,
	[MealPeriod] [nvarchar](50) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyCategorySummaryByPeriod] ADD  CONSTRAINT [DF_DailyCategorySummaryByPeriod_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
