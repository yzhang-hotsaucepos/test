USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Item]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RefNum] [nvarchar](200) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[HotItem] [bit] NOT NULL,
	[RecipeUnitID] [int] NOT NULL,
	[InitialCost] [decimal](18, 2) NULL,
	[CountPeriod] [int] NULL,
	[CountUnitID] [int] NOT NULL,
	[UPC] [nvarchar](200) NULL,
	[WastePercent] [decimal](18, 3) NULL,
	[PrepItem] [bit] NOT NULL,
	[AlertQty] [int] NULL,
	[PreferredVendorID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdate] [datetime] NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_Item]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Item_Inv_CountPeriods] FOREIGN KEY([CountPeriod])
REFERENCES [dbo].[Inv_CountPeriods] ([ID])
GO
ALTER TABLE [dbo].[Inv_Item] CHECK CONSTRAINT [FK_Inv_Item_Inv_CountPeriods]
GO
ALTER TABLE [dbo].[Inv_Item]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Item_Inv_ItemCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Inv_ItemCategory] ([ID])
GO
ALTER TABLE [dbo].[Inv_Item] CHECK CONSTRAINT [FK_Inv_Item_Inv_ItemCategory]
GO
ALTER TABLE [dbo].[Inv_Item]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Item_Inv_UnitOfMeasures] FOREIGN KEY([RecipeUnitID])
REFERENCES [dbo].[Inv_UnitOfMeasures] ([ID])
GO
ALTER TABLE [dbo].[Inv_Item] CHECK CONSTRAINT [FK_Inv_Item_Inv_UnitOfMeasures]
GO
ALTER TABLE [dbo].[Inv_Item]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Item_Inv_UnitOfMeasures1] FOREIGN KEY([CountUnitID])
REFERENCES [dbo].[Inv_UnitOfMeasures] ([ID])
GO
ALTER TABLE [dbo].[Inv_Item] CHECK CONSTRAINT [FK_Inv_Item_Inv_UnitOfMeasures1]
GO
ALTER TABLE [dbo].[Inv_Item]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Item_Inv_Vendor] FOREIGN KEY([PreferredVendorID])
REFERENCES [dbo].[Inv_Vendor] ([ID])
GO
ALTER TABLE [dbo].[Inv_Item] CHECK CONSTRAINT [FK_Inv_Item_Inv_Vendor]
GO
