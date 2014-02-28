USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyTaxSummary]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyTaxSummary](
	[StoreID] [int] NULL,
	[Taxname] [nvarchar](50) NULL,
	[TaxAmt] [decimal](18, 2) NULL,
	[OrderAmt] [decimal](18, 2) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyTaxSummary] ADD  CONSTRAINT [DF_DailyTaxSummary_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
