USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyPaymentSummary]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyPaymentSummary](
	[StoreID] [int] NULL,
	[PaymentName] [nvarchar](50) NULL,
	[NumPayments] [int] NULL,
	[Sales] [decimal](18, 2) NULL,
	[TipTotal] [decimal](18, 2) NULL,
	[TtlSrvCharge] [decimal](18, 2) NULL,
	[TtlReceived] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyPaymentSummary] ADD  CONSTRAINT [DF_DailyPaymentSummary_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
