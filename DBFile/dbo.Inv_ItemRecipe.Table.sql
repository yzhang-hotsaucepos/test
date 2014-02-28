USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemRecipe]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemRecipe](
	[RecipeItemID] [int] NOT NULL,
	[InvItemID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_Inv_ItemRecipe_1] PRIMARY KEY CLUSTERED 
(
	[RecipeItemID] ASC,
	[InvItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
