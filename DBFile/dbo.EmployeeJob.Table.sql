USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EmployeeJob]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeJob](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Wage] [money] NULL,
	[OvertimeWage] [money] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[WageType] [nvarchar](50) NULL,
	[OverTimeRate] [money] NULL,
 CONSTRAINT [PK_EmployeeJob_1] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
