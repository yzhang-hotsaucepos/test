USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailySaleDetails]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySaleDetails](
	[StoreID] [int] NULL,
	[GCSales] [decimal](18, 2) NULL,
	[TotalPaidIn] [decimal](18, 2) NULL,
	[InHousePaymentSales] [decimal](18, 2) NULL,
	[advPayment] [decimal](18, 2) NULL,
	[surchageamt] [decimal](18, 2) NULL,
	[TotalPaidOut] [decimal](18, 2) NULL,
	[PaidAdv] [decimal](18, 2) NULL,
	[ReimbursementTtl] [decimal](18, 2) NULL,
	[Tipwithheld] [decimal](18, 2) NULL,
	[CashDeposit] [decimal](18, 2) NULL,
	[GrossCash] [decimal](18, 2) NULL,
	[CCTipTtl] [decimal](18, 2) NULL,
	[TtlSrvCharge] [decimal](18, 2) NULL,
	[GCChangeTTL] [decimal](18, 2) NULL,
	[NetCash] [decimal](18, 2) NULL,
	[OtherPayments] [decimal](18, 2) NULL,
	[CashOverShort] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[NetSaleTotal] [decimal](18, 2) NULL,
	[TaxTotal] [decimal](18, 2) NULL,
	[CashSrvChargeTTL] [decimal](18, 2) NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailySaleDetails] ADD  CONSTRAINT [DF_DailySaleDetails_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
