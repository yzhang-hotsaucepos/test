USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblMODIFIER_MENU_SETUP]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblMODIFIER_MENU_SETUP](
	[ModifierMenuID] [nvarchar](20) NOT NULL,
	[Language_1_Name] [nvarchar](30) NULL,
	[Language_2_Name] [nvarchar](30) NULL,
	[Language_3_Name] [nvarchar](30) NULL,
	[Language_4_Name] [nvarchar](30) NULL,
	[Language_5_Name] [nvarchar](30) NULL,
	[ForceModifier] [char](1) NULL,
	[ModifierMenuType] [nvarchar](10) NULL,
	[Limit_Num_Allowed] [char](1) NULL,
	[ShortCut_Menu] [nvarchar](30) NULL,
	[ModifierMenuCategory] [nvarchar](15) NULL,
	[last_update] [datetime] NULL,
	[Num_Free] [int] NULL,
	[ModFilename] [varchar](10) NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CDM_tblMODIFIER_MENU_SETUP] PRIMARY KEY CLUSTERED 
(
	[ModifierMenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Modifiers Free' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CDM_tblMODIFIER_MENU_SETUP', @level2type=N'COLUMN',@level2name=N'Num_Free'
GO
