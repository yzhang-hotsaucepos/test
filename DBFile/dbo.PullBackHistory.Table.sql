USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[PullBackHistory]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PullBackHistory](
	[StoreID] [int] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[CheckID] [bigint] NOT NULL,
	[LineNum] [int] NOT NULL,
	[Seat] [nvarchar](50) NULL,
	[ServerID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[PullBackDate] [datetime] NULL,
	[ToTable] [nvarchar](50) NULL,
	[Amount] [money] NULL,
	[MethodID] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_PullBackHistory] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[OrderID] ASC,
	[BusinessDate] ASC,
	[CheckID] ASC,
	[LineNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
