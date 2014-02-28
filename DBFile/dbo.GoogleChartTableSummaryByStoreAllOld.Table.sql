USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[GoogleChartTableSummaryByStoreAllOld]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoogleChartTableSummaryByStoreAllOld](
	[StoreID] [int] NOT NULL,
	[NumTable] [int] NULL,
	[Period] [nvarchar](50) NOT NULL,
	[BusinessDate] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GoogleChartTableSummaryByStoreAllOld] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[Period] ASC,
	[BusinessDate] ASC,
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''MONTH'',''DAY''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GoogleChartTableSummaryByStoreAllOld', @level2type=N'COLUMN',@level2name=N'Type'
GO
