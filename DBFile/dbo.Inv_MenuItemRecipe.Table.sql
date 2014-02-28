USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_MenuItemRecipe]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MenuItemRecipe](
	[InvMID] [int] NOT NULL,
	[InvItemID] [int] NOT NULL,
	[Qty] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Inv_MenuItemRecipe_1] PRIMARY KEY CLUSTERED 
(
	[InvMID] ASC,
	[InvItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_MenuItemRecipe]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MenuItemRecipe_Inv_Item] FOREIGN KEY([InvItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_MenuItemRecipe] CHECK CONSTRAINT [FK_Inv_MenuItemRecipe_Inv_Item]
GO
ALTER TABLE [dbo].[Inv_MenuItemRecipe]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MenuItemRecipe_Inv_MenuItem] FOREIGN KEY([InvMID])
REFERENCES [dbo].[Inv_MenuItem] ([ID])
GO
ALTER TABLE [dbo].[Inv_MenuItemRecipe] CHECK CONSTRAINT [FK_Inv_MenuItemRecipe_Inv_MenuItem]
GO
