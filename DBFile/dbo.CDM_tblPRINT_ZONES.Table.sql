USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblPRINT_ZONES]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblPRINT_ZONES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PZID] [int] NULL,
	[PrintZone_Name] [nvarchar](50) NULL,
	[PrintZone_Path] [nvarchar](512) NULL,
	[PrintZone_Status] [nvarchar](50) NULL,
	[PrinterType] [nvarchar](50) NULL,
	[Default_Delay_Time] [int] NULL,
	[Priority_Delay_Time] [int] NULL,
	[Prompt_Printer] [char](1) NOT NULL,
	[Auto_Redirect_Offline] [char](1) NOT NULL,
	[backup_printer] [nvarchar](50) NOT NULL,
	[backup_printer_path] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_CDM_tblPRINT_ZONES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CDM_tblPRINT_ZONES', @level2type=N'COLUMN',@level2name=N'backup_printer_path'
GO
ALTER TABLE [dbo].[CDM_tblPRINT_ZONES] ADD  CONSTRAINT [DF_CDM_tblPRINT_ZONES_Priority_Delay_Time]  DEFAULT ((0)) FOR [Priority_Delay_Time]
GO
ALTER TABLE [dbo].[CDM_tblPRINT_ZONES] ADD  CONSTRAINT [DF_CDM_tblPRINT_ZONES_Prompt_Printer]  DEFAULT ('N') FOR [Prompt_Printer]
GO
ALTER TABLE [dbo].[CDM_tblPRINT_ZONES] ADD  CONSTRAINT [DF_CDM_tblPRINT_ZONES_Auto_Redirect_Offline]  DEFAULT ('N') FOR [Auto_Redirect_Offline]
GO
ALTER TABLE [dbo].[CDM_tblPRINT_ZONES] ADD  CONSTRAINT [DF_CDM_tblPRINT_ZONES_backup_printer]  DEFAULT (N'NOT USED') FOR [backup_printer]
GO
ALTER TABLE [dbo].[CDM_tblPRINT_ZONES] ADD  CONSTRAINT [DF_CDM_tblPRINT_ZONES_backup_printer_path]  DEFAULT (N'NOT USED') FOR [backup_printer_path]
GO
