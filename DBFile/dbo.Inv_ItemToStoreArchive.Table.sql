USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemToStoreArchive]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemToStoreArchive](
	[ItemID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[UnitOnHand] [decimal](18, 2) NOT NULL,
	[LastUnitPrice] [decimal](18, 2) NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]
GO
