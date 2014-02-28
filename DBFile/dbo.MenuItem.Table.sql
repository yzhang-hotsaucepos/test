USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Price] [money] NULL,
	[MIType] [nvarchar](15) NULL,
	[IsModifier] [bit] NOT NULL,
	[ReportName] [nvarchar](50) NULL,
	[ReportCategory] [nvarchar](50) NULL,
	[ReportDepartment] [nvarchar](50) NULL,
	[Cost] [money] NULL,
	[Status] [nvarchar](20) NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
