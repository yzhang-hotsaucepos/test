USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Order]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[PONum] [nvarchar](200) NULL,
	[OrderStatus] [int] NOT NULL,
	[PostDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[EstDeliveryDate] [datetime] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[Note] [nvarchar](max) NULL,
	[LastUpdate] [datetime] NULL,
	[CreatedID] [int] NOT NULL,
	[CreatedName] [nvarchar](200) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Inv_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_Order]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Order_Inv_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Inv_Vendor] ([ID])
GO
ALTER TABLE [dbo].[Inv_Order] CHECK CONSTRAINT [FK_Inv_Order_Inv_Vendor]
GO
