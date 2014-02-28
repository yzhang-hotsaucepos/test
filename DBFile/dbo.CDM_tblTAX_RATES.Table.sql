USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblTAX_RATES]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblTAX_RATES](
	[tax_id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_CDM_tblTAX_RATES] PRIMARY KEY CLUSTERED 
(
	[tax_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_tblTAX_RATES] ADD  CONSTRAINT [DF_CDM_tblTAX_RATES_tax_make_exclusive]  DEFAULT ('N') FOR [tax_make_exclusive]
GO
ALTER TABLE [dbo].[CDM_tblTAX_RATES] ADD  CONSTRAINT [DF_CDM_tblTAX_RATES_tax_make_tax_id]  DEFAULT ((0)) FOR [tax_make_tax_id]
GO
ALTER TABLE [dbo].[CDM_tblTAX_RATES] ADD  CONSTRAINT [DF_CDM_tblTAX_RATES_tax_deleted]  DEFAULT ('N') FOR [tax_deleted]
GO
ALTER TABLE [dbo].[CDM_tblTAX_RATES] ADD  CONSTRAINT [DF_CDM_tblTAX_RATES_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
