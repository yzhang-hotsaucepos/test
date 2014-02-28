USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyGuestTableSummaryByPeriod]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyGuestTableSummaryByPeriod](
	[StoreID] [int] NULL,
	[SaleGroup] [nvarchar](50) NULL,
	[RecordType] [nvarchar](50) NULL,
	[Value] [decimal](18, 2) NULL,
	[OrderCol] [int] NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyGuestTableSummaryByPeriod] ADD  CONSTRAINT [DF_DailyGuestTableSummaryByPeriod_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
