USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborScheduleShiftDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborScheduleShiftDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftID] [int] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[LunchBeginTime] [datetime] NULL,
	[LunchEndTime] [datetime] NULL,
	[DinnerBeginTime] [datetime] NULL,
	[DinnerEndTime] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
	[ColorName] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
	[AttendanceID] [int] NOT NULL,
	[IsGiveUp] [int] NOT NULL,
	[GiveUpFrom] [int] NOT NULL,
	[GiveUpStatus] [int] NOT NULL,
 CONSTRAINT [PK_LaborScheduleShiftDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LaborScheduleShiftDetail] ADD  CONSTRAINT [DF_LaborScheduleShiftDetail_IsGiveUp]  DEFAULT ((0)) FOR [IsGiveUp]
GO
ALTER TABLE [dbo].[LaborScheduleShiftDetail] ADD  CONSTRAINT [DF_LaborScheduleShiftDetail_GiveUpFrom]  DEFAULT ((0)) FOR [GiveUpFrom]
GO
ALTER TABLE [dbo].[LaborScheduleShiftDetail] ADD  CONSTRAINT [DF_LaborScheduleShiftDetail_GiveUpStatus]  DEFAULT ((0)) FOR [GiveUpStatus]
GO
