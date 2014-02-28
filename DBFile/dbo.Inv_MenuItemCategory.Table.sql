USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_MenuItemCategory]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MenuItemCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ParentID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[DisplaySeq] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ShowInReport] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
	[Layer] [int] NULL,
 CONSTRAINT [PK_Inv_MenuItemCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
