USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_VendorTotenderType]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_VendorTotenderType](
	[VendorID] [int] NOT NULL,
	[TenderTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Inventory_VendorTotenderType] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[TenderTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_VendorTotenderType]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_VendorTotenderType_Inventory_TenderType] FOREIGN KEY([TenderTypeID])
REFERENCES [dbo].[Inv_TenderType] ([ID])
GO
ALTER TABLE [dbo].[Inv_VendorTotenderType] CHECK CONSTRAINT [FK_Inventory_VendorTotenderType_Inventory_TenderType]
GO
ALTER TABLE [dbo].[Inv_VendorTotenderType]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_VendorTotenderType_Inventory_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Inv_Vendor] ([ID])
GO
ALTER TABLE [dbo].[Inv_VendorTotenderType] CHECK CONSTRAINT [FK_Inventory_VendorTotenderType_Inventory_Vendor]
GO
