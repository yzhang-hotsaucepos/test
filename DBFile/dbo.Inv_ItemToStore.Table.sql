USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemToStore]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemToStore](
	[ItemID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[UnitOnHand] [decimal](18, 2) NULL,
	[LastUnitPrice] [decimal](18, 2) NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
	[IsActive] [bit] NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Inv_ItemStore] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_ItemToStore]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemStore_Inv_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemToStore] CHECK CONSTRAINT [FK_Inv_ItemStore_Inv_Item]
GO
