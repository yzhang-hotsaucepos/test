USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_StoreOrderItemCost]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_StoreOrderItemCost](
	[StoreID] [int] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[LineItemID] [int] NOT NULL,
	[TtlCost] [money] NOT NULL,
 CONSTRAINT [PK_Inv_StoreOrderItemCost] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[OrderID] ASC,
	[LineItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
