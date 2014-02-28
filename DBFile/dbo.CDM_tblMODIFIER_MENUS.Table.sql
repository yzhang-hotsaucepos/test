USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblMODIFIER_MENUS]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_tblMODIFIER_MENUS](
	[ModifierMenuID] [nvarchar](20) NOT NULL,
	[MenuItemID] [nchar](30) NOT NULL,
	[Display_Sequence] [smallint] NULL,
	[ModifierPrice] [money] NOT NULL,
	[UseModifierPrice] [bit] NOT NULL,
	[PriceLevel] [smallint] NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblMODIFIER_LINKS] PRIMARY KEY CLUSTERED 
(
	[ModifierMenuID] ASC,
	[MenuItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CDM_tblMODIFIER_MENUS] ADD  CONSTRAINT [DF_CDM_tblMODIFIER_MENUS_Price]  DEFAULT ((0)) FOR [ModifierPrice]
GO
ALTER TABLE [dbo].[CDM_tblMODIFIER_MENUS] ADD  CONSTRAINT [DF_CDM_tblMODIFIER_MENUS_UseModifierPrice]  DEFAULT ((0)) FOR [UseModifierPrice]
GO
ALTER TABLE [dbo].[CDM_tblMODIFIER_MENUS] ADD  CONSTRAINT [DF_CDM_tblMODIFIER_MENUS_PriceLevel]  DEFAULT ((0)) FOR [PriceLevel]
GO
