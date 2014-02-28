USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyGuestTableSummaryByPC]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyGuestTableSummaryByPC](
	[StoreID] [int] NULL,
	[RevenueCenterName] [nvarchar](50) NULL,
	[NumTables] [int] NULL,
	[NumGuest] [int] NULL,
	[NumChecks] [int] NULL,
	[ProfitTotal] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyGuestTableSummaryByPC] ADD  CONSTRAINT [DF_DailyGuestTableSummaryByPC_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
