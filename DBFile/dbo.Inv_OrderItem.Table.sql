USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_OrderItem]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_OrderItem](
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemLineID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[OrderUnitID] [int] NOT NULL,
 CONSTRAINT [PK_Inv_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ItemID] ASC,
	[OrderUnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_Inv_OrderItem_Inv_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_OrderItem] CHECK CONSTRAINT [FK_Inv_OrderItem_Inv_Item]
GO
ALTER TABLE [dbo].[Inv_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_Inv_OrderItem_Inv_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Inv_Order] ([ID])
GO
ALTER TABLE [dbo].[Inv_OrderItem] CHECK CONSTRAINT [FK_Inv_OrderItem_Inv_Order]
GO
