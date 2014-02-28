USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_MenuItem]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MenuItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[RefNumber] [nvarchar](50) NULL,
	[CategoryID] [int] NOT NULL,
	[IsEntree] [bit] NOT NULL,
	[IsModifier] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Recipe] [nvarchar](max) NULL,
	[FromPOS] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_MenuItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MenuItem_Inv_MenuItemCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Inv_MenuItemCategory] ([ID])
GO
ALTER TABLE [dbo].[Inv_MenuItem] CHECK CONSTRAINT [FK_Inv_MenuItem_Inv_MenuItemCategory]
GO
