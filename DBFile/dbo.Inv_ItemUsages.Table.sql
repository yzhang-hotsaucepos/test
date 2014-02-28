USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemUsages]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemUsages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[InvItemID] [int] NOT NULL,
	[Usage] [decimal](18, 2) NOT NULL,
	[UnitCostPerUnit] [decimal](18, 2) NOT NULL,
	[StMID] [int] NOT NULL,
	[LineItemID] [int] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_Inv_ItemUsages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
