USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Check]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Check](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNum] [nvarchar](50) NULL,
	[Type] [int] NOT NULL,
	[CheckNum] [nvarchar](50) NULL,
	[VendorID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_Check] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_Check]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Check_Inv_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Inv_Vendor] ([ID])
GO
ALTER TABLE [dbo].[Inv_Check] CHECK CONSTRAINT [FK_Inv_Check_Inv_Vendor]
GO
