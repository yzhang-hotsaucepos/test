USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborScheduleInfo]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborScheduleInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[Weekly] [datetime] NOT NULL,
	[IsPublic] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_LaborScheduleInfo] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC,
	[Weekly] ASC,
	[StoreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
