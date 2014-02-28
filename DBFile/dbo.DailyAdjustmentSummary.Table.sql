USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DailyAdjustmentSummary]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyAdjustmentSummary](
	[StoreID] [int] NULL,
	[AdjustType] [nvarchar](50) NULL,
	[AdjustName] [nvarchar](50) NULL,
	[Total] [decimal](18, 2) NULL,
	[Count] [int] NULL,
	[BusinessDate] [datetime] NULL,
	[Lastupdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyAdjustmentSummary] ADD  CONSTRAINT [DF_DailyAdjustmentSummary_lastupdate]  DEFAULT (getdate()) FOR [Lastupdate]
GO
