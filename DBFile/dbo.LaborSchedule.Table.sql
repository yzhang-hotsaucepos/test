USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborSchedule]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Postions] [nvarchar](2000) NOT NULL,
	[IsPublic] [int] NOT NULL,
 CONSTRAINT [PK_LaborSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
