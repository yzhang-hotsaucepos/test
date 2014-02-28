USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[StoreID] [int] NOT NULL,
	[ID] [bigint] NOT NULL,
	[OpenTime] [datetime] NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[EmpIDOpen] [int] NOT NULL,
	[EmpIDClose] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[GuestCount] [int] NOT NULL,
	[RevenueCenter] [nvarchar](50) NULL,
	[MealPeriod] [nvarchar](50) NULL,
	[LineItemCount] [int] NULL,
	[CheckCount] [int] NULL,
	[PaymentCount] [int] NULL,
	[TaxCount] [int] NULL,
	[FutureOrder] [char](1) NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC,
	[BusinessDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
