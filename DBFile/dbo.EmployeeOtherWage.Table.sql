USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EmployeeOtherWage]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeOtherWage](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OtherWage] [money] NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmployeeOtherWage] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
