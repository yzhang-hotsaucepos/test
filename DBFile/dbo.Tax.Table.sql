USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[StoreID] [int] NOT NULL,
	[TaxCategoryID] [int] NOT NULL,
	[CheckID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[TaxAmt] [decimal](19, 10) NOT NULL,
	[TaxOrderAmt] [decimal](19, 10) NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Tax_1] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[TaxCategoryID] ASC,
	[CheckID] ASC,
	[OrderID] ASC,
	[Category] ASC,
	[BusinessDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
