USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EmployeeTimeSheet]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTimeSheet](
	[StoreID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[TimeOut] [datetime] NULL,
	[CashTipsDeclared] [money] NULL,
	[ChargedTipsDeclared] [money] NULL,
	[ChargeSales] [money] NULL,
	[Covers] [int] NULL,
	[Discounts] [money] NULL,
	[EntreeCount] [int] NULL,
	[GCSold] [money] NULL,
	[GCRedeemed] [money] NULL,
	[PositionID] [int] NOT NULL,
	[NetSales] [money] NULL,
	[PayRate] [money] NULL,
	[Numtables] [int] NULL,
	[TaxCollected] [money] NULL,
	[TipDeclared] [money] NULL,
	[IndirectTipsDeclared] [money] NULL,
	[TipPoolContribution] [money] NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[HoursWorked] [decimal](18, 3) NULL,
	[OT1HoursWorked] [decimal](18, 3) NOT NULL,
	[OT1Payrate] [money] NOT NULL,
	[OT2HoursWorked] [decimal](18, 3) NOT NULL,
	[OT2Payrate] [money] NOT NULL,
 CONSTRAINT [PK_EmployeeTimeSheet] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[EmployeeID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
