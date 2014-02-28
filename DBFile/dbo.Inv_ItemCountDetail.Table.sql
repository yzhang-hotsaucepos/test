USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemCountDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemCountDetail](
	[CountID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[StockUnitQOH] [decimal](18, 2) NULL,
	[UseUnitQOH] [decimal](18, 2) NULL,
	[StockUnitTOH] [decimal](18, 2) NULL,
	[UseUnitTOH] [decimal](18, 2) NULL,
	[CountQOH] [decimal](18, 2) NULL,
	[TOH] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Inv_ItemCountDetail] PRIMARY KEY CLUSTERED 
(
	[CountID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_ItemCountDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemCountDetail_Inv_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemCountDetail] CHECK CONSTRAINT [FK_Inv_ItemCountDetail_Inv_Item]
GO
ALTER TABLE [dbo].[Inv_ItemCountDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemCountDetail_Inv_ItemCountDetail] FOREIGN KEY([CountID], [ItemID])
REFERENCES [dbo].[Inv_ItemCountDetail] ([CountID], [ItemID])
GO
ALTER TABLE [dbo].[Inv_ItemCountDetail] CHECK CONSTRAINT [FK_Inv_ItemCountDetail_Inv_ItemCountDetail]
GO
