USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderLineItem](
	[StoreID] [int] NOT NULL,
	[ID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[RecordType] [nvarchar](50) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Qty] [int] NOT NULL,
	[Seat] [nvarchar](50) NOT NULL,
	[AdjustedPrice] [money] NULL,
	[AdjustID] [int] NULL,
	[EmployeeID] [int] NULL,
	[TimeOrdered] [datetime] NULL,
	[ParentSplitLineNum] [int] NOT NULL,
	[NumSplits] [smallint] NOT NULL,
	[SI] [nvarchar](3) NOT NULL,
	[SIText] [nvarchar](50) NULL,
	[AsEntree] [char](1) NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OrderLineItem_1] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC,
	[OrderID] ASC,
	[BusinessDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
