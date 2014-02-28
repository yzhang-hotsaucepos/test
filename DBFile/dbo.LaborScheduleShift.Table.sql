USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborScheduleShift]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborScheduleShift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Weekly] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_LaborScheduleShift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
