USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblSURCHARGES]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblSURCHARGES](
	[sur_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sur_desc] [nvarchar](20) NULL,
	[sur_type] [varchar](10) NULL,
	[sur_amt] [money] NULL,
	[sur_percent] [decimal](18, 4) NULL,
	[sur_lastupdate] [datetime] NULL,
	[sur_deleted] [char](1) NOT NULL,
	[last_update] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CDM_tblSURCHARGES] PRIMARY KEY CLUSTERED 
(
	[sur_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_tblSURCHARGES] ADD  CONSTRAINT [DF_CDM_tblSURCHARGES_sur_deleted]  DEFAULT ('N') FOR [sur_deleted]
GO
ALTER TABLE [dbo].[CDM_tblSURCHARGES] ADD  CONSTRAINT [DF_CDM_tblSURCHARGES_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
