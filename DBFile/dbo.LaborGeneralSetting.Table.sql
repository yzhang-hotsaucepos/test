USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborGeneralSetting]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborGeneralSetting](
	[WorkWeekOvertime] [int] NOT NULL,
	[WorkDayOvertime] [int] NOT NULL,
	[PublishUnassignedShifts] [bit] NOT NULL,
	[AllowOnCallShifts] [bit] NOT NULL,
	[CaliforniaLaborLaws] [bit] NOT NULL
) ON [PRIMARY]
GO
