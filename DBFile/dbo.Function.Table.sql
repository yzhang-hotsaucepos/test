USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Function]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Function](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParnetID] [int] NOT NULL,
	[PathLevel] [int] NOT NULL,
	[Path] [nvarchar](200) NULL,
	[TabMenuID] [int] NOT NULL,
	[Enable] [bit] NOT NULL,
	[Sort] [int] NULL,
 CONSTRAINT [PK_function] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
