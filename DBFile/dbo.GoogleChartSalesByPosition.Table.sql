USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[GoogleChartSalesByPosition]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoogleChartSalesByPosition](
	[StoreID] [int] NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
	[Period] [nvarchar](50) NOT NULL,
	[BusinessDate] [nvarchar](50) NOT NULL,
	[Sales] [decimal](18, 2) NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GoogleChartSalesByPosition] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[PositionName] ASC,
	[Period] ASC,
	[BusinessDate] ASC,
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
