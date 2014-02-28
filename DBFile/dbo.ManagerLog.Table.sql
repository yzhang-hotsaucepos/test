USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ManagerLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[AllowFlagging] [bit] NULL,
	[MultiEntryField] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[Sequence] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ManagerLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'MultiEntryField'
GO
