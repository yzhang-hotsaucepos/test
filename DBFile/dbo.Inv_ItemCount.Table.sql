USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemCount]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemCount](
	[CountID] [int] IDENTITY(1,1) NOT NULL,
	[WeekEnding] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[CountType] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_ItemCount] PRIMARY KEY CLUSTERED 
(
	[WeekEnding] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_ItemCount]  WITH CHECK ADD  CONSTRAINT [CK_Inv_ItemCount] CHECK  ((datepart(weekday,[WeekEnding])=(7)))
GO
ALTER TABLE [dbo].[Inv_ItemCount] CHECK CONSTRAINT [CK_Inv_ItemCount]
GO
