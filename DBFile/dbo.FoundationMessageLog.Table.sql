USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[FoundationMessageLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoundationMessageLog](
	[StoreID] [int] NOT NULL,
	[PreTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[IsCalculating] [bit] NOT NULL,
 CONSTRAINT [PK_FoundationMessageLog] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
