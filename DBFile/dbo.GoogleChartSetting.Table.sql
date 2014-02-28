USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[GoogleChartSetting]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoogleChartSetting](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Describe] [nvarchar](200) NOT NULL,
	[ShowType] [int] NOT NULL,
	[IntervalType] [int] NOT NULL,
	[IsShow] [bit] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'table=0,chart=1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GoogleChartSetting', @level2type=N'COLUMN',@level2name=N'ShowType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'day=0,month=1,quarter=2,year=3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GoogleChartSetting', @level2type=N'COLUMN',@level2name=N'IntervalType'
GO
ALTER TABLE [dbo].[GoogleChartSetting] ADD  CONSTRAINT [DF_GoogleChartSetting_TableOrChart]  DEFAULT ((1)) FOR [ShowType]
GO
ALTER TABLE [dbo].[GoogleChartSetting] ADD  CONSTRAINT [DF_GoogleChartSetting_IntervalType]  DEFAULT ((1)) FOR [IntervalType]
GO
ALTER TABLE [dbo].[GoogleChartSetting] ADD  CONSTRAINT [DF_GoogleChartSetting_Enable]  DEFAULT ((1)) FOR [IsShow]
GO
