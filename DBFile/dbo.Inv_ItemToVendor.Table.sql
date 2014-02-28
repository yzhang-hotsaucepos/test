USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemToVendor]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemToVendor](
	[ItemID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[SupplierCode] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
	[LastUnitPrice] [decimal](18, 2) NULL,
	[OrderUnit] [int] NOT NULL,
	[StockPerOrder] [decimal](18, 2) NULL,
	[ReceipePerStock] [decimal](18, 2) NULL,
	[UPC] [nvarchar](200) NULL,
	[DisplaySeq] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_ItemToVendor] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[VendorID] ASC,
	[OrderUnit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_ItemToVendor]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemToVendor_Inv_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemToVendor] CHECK CONSTRAINT [FK_Inv_ItemToVendor_Inv_Item]
GO
ALTER TABLE [dbo].[Inv_ItemToVendor]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemToVendor_Inv_UnitOfMeasures] FOREIGN KEY([OrderUnit])
REFERENCES [dbo].[Inv_UnitOfMeasures] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemToVendor] CHECK CONSTRAINT [FK_Inv_ItemToVendor_Inv_UnitOfMeasures]
GO
ALTER TABLE [dbo].[Inv_ItemToVendor]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemToVendor_Inv_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Inv_Vendor] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemToVendor] CHECK CONSTRAINT [FK_Inv_ItemToVendor_Inv_Vendor]
GO
