USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EmailSendAgain]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSendAgain](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[ContentText] [nvarchar](max) NULL,
	[AddressTo] [nvarchar](max) NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[HasSend] [bit] NOT NULL,
	[StoreID] [int] NULL,
	[FromUserID] [int] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_EmailSendAgain] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailSendAgain] ADD  CONSTRAINT [DF_EmailSendAgain_HasSend]  DEFAULT ((0)) FOR [HasSend]
GO
