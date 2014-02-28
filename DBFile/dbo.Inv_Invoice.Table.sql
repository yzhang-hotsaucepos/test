USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Invoice]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Invoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvOrderID] [int] NOT NULL,
	[Num] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
	[DueDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[WeekEnding] [datetime] NULL,
	[ReceivedByID] [int] NOT NULL,
	[InvoiceTotal] [decimal](18, 2) NOT NULL,
	[DiscountTotal] [decimal](18, 2) NULL,
	[TaxTotal] [decimal](18, 2) NULL,
	[ShippingTotal] [decimal](18, 2) NULL,
	[PaidTotal] [decimal](18, 2) NULL,
	[TenderTypeID] [int] NOT NULL,
	[CheckNum] [nvarchar](50) NULL,
	[Comment] [nvarchar](max) NULL,
	[LastUpdate] [datetime] NULL,
	[CreatedID] [int] NOT NULL,
	[CreatedName] [nvarchar](200) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](200) NULL,
	[CreationDate] [datetime] NULL,
	[storeid] [int] NOT NULL,
	[vendorid] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Inv_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Invoice_Inv_Order] FOREIGN KEY([InvOrderID])
REFERENCES [dbo].[Inv_Order] ([ID])
GO
ALTER TABLE [dbo].[Inv_Invoice] CHECK CONSTRAINT [FK_Inv_Invoice_Inv_Order]
GO
ALTER TABLE [dbo].[Inv_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Invoice_Inv_TenderType] FOREIGN KEY([TenderTypeID])
REFERENCES [dbo].[Inv_TenderType] ([ID])
GO
ALTER TABLE [dbo].[Inv_Invoice] CHECK CONSTRAINT [FK_Inv_Invoice_Inv_TenderType]
GO
