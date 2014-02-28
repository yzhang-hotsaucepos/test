USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemToLocation]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemToLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[InvItemID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[DisplaySeq] [int] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
	[lastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Inv_ItemToLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
