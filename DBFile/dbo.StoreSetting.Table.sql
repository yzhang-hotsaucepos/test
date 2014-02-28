USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[StoreSetting]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoreSetting](
	[StoreID] [int] NOT NULL,
	[PercentWithheldTips] [real] NULL,
	[DriverRoutingInstalled] [char](1) NULL,
	[SurchargeGuestPays] [char](1) NULL,
	[OTWorkweekThreshold] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
	[OTHoursType] [int] NOT NULL,
	[InventoryInstalled] [bit] NULL,
 CONSTRAINT [PK_StoreSetting] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
