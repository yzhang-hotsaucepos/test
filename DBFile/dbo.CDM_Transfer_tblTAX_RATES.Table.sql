USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_Transfer_tblTAX_RATES]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_Transfer_tblTAX_RATES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tax_id] [int] NOT NULL,
	[tax_name] [nvarchar](16) NOT NULL,
	[tax_rate] [decimal](18, 4) NOT NULL,
	[tax_min_amt] [money] NOT NULL,
	[tax_type] [varchar](10) NOT NULL,
	[tax_lastupdate] [datetime] NULL,
	[tax_make_exclusive] [char](1) NOT NULL,
	[tax_make_tax_id] [int] NOT NULL,
	[tax_deleted] [char](1) NOT NULL,
	[last_update] [datetime] NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[TransferState] [int] NOT NULL,
 CONSTRAINT [PK_CDM_tblTAX_RATES_Transfer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_Transfer_tblTAX_RATES] ADD  CONSTRAINT [DF_CDM_tblTAX_RATES_Transfer_TransferState]  DEFAULT ((1)) FOR [TransferState]
GO
