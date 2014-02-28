USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_InvoiceDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_InvoiceDetail](
	[InvoiceID] [int] NOT NULL,
	[InvItemID] [int] NOT NULL,
	[ItemLineID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[OrderUnitID] [int] NOT NULL,
	[DiscountAmt] [decimal](18, 2) NULL,
	[ShoppingAmt] [decimal](18, 2) NULL,
	[TaxAmt] [decimal](18, 2) NULL,
	[LedgerID] [int] NULL,
	[IsReceived] [bit] NULL,
 CONSTRAINT [PK_Inv_InvoiceDetail_1] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[InvItemID] ASC,
	[OrderUnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_InvoiceDetail_Inv_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Inv_Invoice] ([ID])
GO
ALTER TABLE [dbo].[Inv_InvoiceDetail] CHECK CONSTRAINT [FK_Inv_InvoiceDetail_Inv_Invoice]
GO
ALTER TABLE [dbo].[Inv_InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_InvoiceDetail_Inv_Item] FOREIGN KEY([InvItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_InvoiceDetail] CHECK CONSTRAINT [FK_Inv_InvoiceDetail_Inv_Item]
GO
