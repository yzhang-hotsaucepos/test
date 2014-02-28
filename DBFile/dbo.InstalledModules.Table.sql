USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[InstalledModules]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstalledModules](
	[StoreID] [int] NOT NULL,
	[HSModule] [nvarchar](20) NOT NULL,
	[Installed] [char](1) NULL,
	[ModuleEnabled] [char](1) NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_InstalledModules] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[HSModule] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
