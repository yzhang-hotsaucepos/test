USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[PaidOutTrx]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaidOutTrx](
	[StoreID] [int] NOT NULL,
	[PaidOutID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Amount] [money] NULL,
	[ManagerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_PaidOutTrx] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[PaidOutID] ASC,
	[BusinessDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
