USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[MessageManager]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageManager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MsgSubject] [nvarchar](200) NOT NULL,
	[MsgContent] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[SendTo] [nvarchar](max) NULL,
	[StoreID] [int] NULL,
	[SendDate] [datetime] NULL,
	[DelUserID] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
