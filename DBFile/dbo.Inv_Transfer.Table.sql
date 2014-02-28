USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Transfer]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Transfer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromStoreID] [int] NOT NULL,
	[FromUserID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ToStoreID] [int] NOT NULL,
	[ToUserID] [int] NULL,
	[TransferDate] [datetime] NULL,
	[WeekEnding] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Inv_Transfer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
