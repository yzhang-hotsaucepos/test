USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborScheduleTemp]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborScheduleTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Weekly] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_LaborScheduleTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
