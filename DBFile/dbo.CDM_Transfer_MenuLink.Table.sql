USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_Transfer_MenuLink]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_Transfer_MenuLink](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuLink] [nvarchar](50) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[TransferState] [int] NOT NULL,
 CONSTRAINT [PK_CDM_Transfer_MenuLink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CDM_Transfer_MenuLink] ADD  CONSTRAINT [DF_CDM_Transfer_MenuLink_TransferState]  DEFAULT ((1)) FOR [TransferState]
GO
