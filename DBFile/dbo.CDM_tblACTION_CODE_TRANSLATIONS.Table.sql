USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblACTION_CODE_TRANSLATIONS]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_tblACTION_CODE_TRANSLATIONS](
	[ID] [bigint] NOT NULL,
	[Action_Code] [nvarchar](50) NOT NULL,
	[Special_Process] [nvarchar](50) NULL,
	[Security_FieldID] [nvarchar](50) NULL,
	[Security_Module] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[English_Translation] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
