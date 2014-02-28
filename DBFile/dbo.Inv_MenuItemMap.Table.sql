USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_MenuItemMap]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MenuItemMap](
	[StoreID] [int] NULL,
	[InvMID] [int] NOT NULL,
	[stMID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_MenuItemMap]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MenuItemMap_Inv_MenuItem] FOREIGN KEY([InvMID])
REFERENCES [dbo].[Inv_MenuItem] ([ID])
GO
ALTER TABLE [dbo].[Inv_MenuItemMap] CHECK CONSTRAINT [FK_Inv_MenuItemMap_Inv_MenuItem]
GO
