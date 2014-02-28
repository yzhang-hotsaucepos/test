USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyCategorySummaryByPC]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyCategorySummaryByPC](
	[StoreID] [int] NULL,
	[RevenueCenter] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[CatTotal] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyCategorySummaryByPC] ADD  CONSTRAINT [DF_DailyCategorySummaryByPC_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
