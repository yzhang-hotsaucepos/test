USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborWeekStart]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborWeekStart](
	[WeekStartDay] [int] NULL,
	[WeekStartTime] [datetime] NULL,
	[TimeZone] [nvarchar](200) NULL
) ON [PRIMARY]
GO
