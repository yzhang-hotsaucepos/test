USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_tblMENU_PROFILE]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_tblMENU_PROFILE](
	[pk] [bigint] IDENTITY(1,1) NOT NULL,
	[menu_link] [nvarchar](30) NOT NULL,
	[dayofweek] [nvarchar](20) NOT NULL,
	[beginTime] [datetime] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[menu_event] [nvarchar](20) NOT NULL,
	[EditorID] [int] NULL,
	[EditorName] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_CDM_tblMENU_PROFILE] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
