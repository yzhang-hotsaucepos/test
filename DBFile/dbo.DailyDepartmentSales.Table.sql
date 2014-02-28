USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyDepartmentSales]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyDepartmentSales](
	[StoreID] [int] NULL,
	[Department] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[MenuItem] [nvarchar](50) NULL,
	[GrossSales] [decimal](18, 2) NULL,
	[Voids] [decimal](18, 2) NULL,
	[Comps] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyDepartmentSales] ADD  CONSTRAINT [DF_DailyDepartmentSales_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
