USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_MenuItemGroup]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MenuItemGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_MenuItemGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
