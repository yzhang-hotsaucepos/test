USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblMENU_ITEM_ALTERNATE_PRICING]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblMENU_ITEM_ALTERNATE_PRICING](
	[Menu_ItemID] [nvarchar](10) NOT NULL,
	[Effective_Day] [char](1) NOT NULL,
	[Effective_Begin_Time] [datetime] NOT NULL,
	[Effective_End_Time] [datetime] NULL,
	[Alternate_Price] [money] NULL,
	[All_Day_Price] [char](1) NULL,
 CONSTRAINT [PK_CDM_tblMENU_ITEM_ALTERNATE_PRICING] PRIMARY KEY CLUSTERED 
(
	[Menu_ItemID] ASC,
	[Effective_Day] ASC,
	[Effective_Begin_Time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_tblMENU_ITEM_ALTERNATE_PRICING] ADD  CONSTRAINT [DF_CDM_tblMENU_ITEM_ALTERNATE_PRICING_All_Day_Price]  DEFAULT ('N') FOR [All_Day_Price]
GO
