USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EmailSendAgainLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSendAgainLog](
	[ID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[ContentText] [nvarchar](max) NULL,
	[AddressTo] [nvarchar](max) NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[HasSend] [bit] NOT NULL,
	[StoreID] [int] NULL,
	[FromUserID] [int] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[MoveTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
