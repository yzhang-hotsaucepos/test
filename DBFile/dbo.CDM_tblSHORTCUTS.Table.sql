USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblSHORTCUTS]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblSHORTCUTS](
	[ShortcutID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID] [nvarchar](50) NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[Language_2_Name] [nvarchar](50) NULL,
	[Language_3_Name] [nvarchar](50) NULL,
	[Language_4_Name] [nvarchar](50) NULL,
	[Language_5_Name] [nvarchar](50) NULL,
	[Display_Seq] [int] NULL,
	[Link] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[All_Sections] [nvarchar](50) NULL,
	[Section] [nvarchar](50) NULL,
	[Special_Process] [nvarchar](50) NULL,
	[Hide_Menu] [nvarchar](50) NULL,
	[Hide_ShortMenu] [nvarchar](50) NULL,
	[Security_Module] [nvarchar](50) NULL,
	[Security_FieldID] [nvarchar](50) NULL,
	[Show_Button] [nvarchar](50) NULL,
	[UnSelected_State] [nvarchar](50) NULL,
	[Extra_Menu] [nvarchar](50) NULL,
	[ShortCut_Menu] [nvarchar](15) NULL,
	[Menu_Meal_Type] [nvarchar](10) NULL,
	[default_menu_link] [char](1) NOT NULL,
	[fore_color] [nvarchar](15) NOT NULL,
	[back_color_net] [nvarchar](50) NULL,
	[fore_color_net] [nvarchar](50) NULL,
	[Web_Show] [bit] NOT NULL,
	[OrderMan_Caption] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[MCColor] [nvarchar](50) NULL,
	[MCfore_color] [nvarchar](50) NULL,
	[ActionID] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'to show menu item on web on line order system ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CDM_tblSHORTCUTS', @level2type=N'COLUMN',@level2name=N'Web_Show'
GO
ALTER TABLE [dbo].[CDM_tblSHORTCUTS] ADD  CONSTRAINT [DF_CDM_tblSHORTCUTS_default_menu_link]  DEFAULT ('N') FOR [default_menu_link]
GO
ALTER TABLE [dbo].[CDM_tblSHORTCUTS] ADD  CONSTRAINT [DF_CDM_tblSHORTCUTS_fore_color]  DEFAULT ('') FOR [fore_color]
GO
ALTER TABLE [dbo].[CDM_tblSHORTCUTS] ADD  CONSTRAINT [DF_CDM_tblSHORTCUTS_Web_Show]  DEFAULT ((0)) FOR [Web_Show]
GO
