USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DocumentManager]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentManager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FileSize] [int] NOT NULL,
	[FilePath] [nvarchar](200) NOT NULL,
	[FileAlias] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NULL,
	[UserID] [int] NOT NULL,
	[FileType] [nvarchar](50) NULL,
	[WhoCanView] [int] NULL,
	[WhoCanEdit] [int] NULL,
	[CanViewStoreID] [nvarchar](2000) NULL,
	[PubStoreID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentManager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
