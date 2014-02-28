USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblMENU_EVENTS]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDM_tblMENU_EVENTS](
	[pk] [bigint] IDENTITY(1,1) NOT NULL,
	[menu_event] [nvarchar](50) NOT NULL,
	[return_value] [nvarchar](20) NOT NULL,
	[use_same_as_dining] [char](1) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_CDM_tblMENU_EVENTS] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CDM_tblMENU_EVENTS] ADD  CONSTRAINT [DF_CDM_tblMENU_EVENTS_use_same_as_dining]  DEFAULT ('N') FOR [use_same_as_dining]
GO
