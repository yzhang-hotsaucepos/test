USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_Transfer_tblTAXES_CONDITIONAL]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_Transfer_tblTAXES_CONDITIONAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[con_tax_id] [int] NOT NULL,
	[con_desc] [nvarchar](15) NOT NULL,
	[con_type] [varchar](10) NOT NULL,
	[con_primary_tax_id] [int] NOT NULL,
	[con_quantity] [int] NULL,
	[con_check_total] [money] NULL,
	[con_category] [nvarchar](4000) NULL,
	[con_success_tax_id] [int] NULL,
	[con_fail_tax_id] [int] NULL,
	[con_lastupdate] [datetime] NULL,
	[con_deleted] [char](1) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[TransferState] [int] NOT NULL,
 CONSTRAINT [PK_CDM_tblTAXES_CONDITIONAL_Transfer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_Transfer_tblTAXES_CONDITIONAL] ADD  CONSTRAINT [DF_CDM_tblTAXES_CONDITIONAL_Transfer_TransferState]  DEFAULT ((1)) FOR [TransferState]
GO
