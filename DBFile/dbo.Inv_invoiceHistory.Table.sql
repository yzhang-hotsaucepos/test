USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_invoiceHistory]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_invoiceHistory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[Discount] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[Shipping] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[CheckNum] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[PaidDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Num] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NULL,
	[PaidTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Inv_invoiceHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
