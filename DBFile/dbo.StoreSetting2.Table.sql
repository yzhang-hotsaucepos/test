USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[StoreSetting2]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreSetting2](
	[StoreID] [int] NOT NULL,
	[InventoryInstalled] [bit] NULL,
	[EodTime] [datetime] NULL
) ON [PRIMARY]
GO
