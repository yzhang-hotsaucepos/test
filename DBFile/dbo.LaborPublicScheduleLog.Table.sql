USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborPublicScheduleLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborPublicScheduleLog](
	[ID] [int] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[Event] [int] NOT NULL,
	[EmpID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[WeekOf] [datetime] NOT NULL
) ON [PRIMARY]
GO
