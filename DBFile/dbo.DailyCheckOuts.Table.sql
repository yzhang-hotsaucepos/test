USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyCheckOuts]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyCheckOuts](
	[StoreID] [int] NOT NULL,
	[CheckOutID] [int] NOT NULL,
	[RunDate] [datetime] NULL,
	[RunTime] [datetime] NULL,
	[BusinessDate] [datetime] NULL,
	[ServerID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[NumSaleRec] [int] NULL,
	[TotalSales] [money] NULL,
	[TotalTip] [money] NULL,
	[TotalPymnt] [money] NULL,
	[Status] [nvarchar](50) NULL,
	[CashSales] [money] NULL,
	[ChargeSales] [money] NULL,
	[NetSales] [money] NULL,
	[ActualBusinessDate] [datetime] NULL,
	[CashDue] [money] NOT NULL,
	[CashReceived] [money] NOT NULL,
	[ActualCashEntered] [char](1) NOT NULL,
	[Covers] [bigint] NULL,
	[Discounts] [money] NULL,
	[EntreeCount] [bigint] NULL,
	[GCSold] [money] NULL,
	[GCRedeemed] [money] NULL,
	[NumTables] [bigint] NULL,
	[TaxCollected] [money] NULL,
	[OtherSales] [money] NULL,
	[ChargeTips] [money] NULL,
	[CompleteStatus] [char](1) NOT NULL,
	[TipWithheld] [money] NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_DailyCheckOuts] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[CheckOutID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DailyCheckOuts] ADD  CONSTRAINT [DF_DailyCheckOuts_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
