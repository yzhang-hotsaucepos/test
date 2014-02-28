USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[TabMenu]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TabMenu](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[parentID] [int] NOT NULL,
	[PathLevel] [int] NOT NULL,
	[Path] [nvarchar](200) NULL,
	[Sort] [int] NOT NULL,
	[UserType] [int] NOT NULL,
	[Css] [nvarchar](200) NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_TabMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'enterprise&all store =1,
enterprise&one store =2,
storeManager=4,
storeUser=8
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TabMenu', @level2type=N'COLUMN',@level2name=N'UserType'
GO
ALTER TABLE [dbo].[TabMenu] ADD  CONSTRAINT [DF_TabMenu_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[TabMenu] ADD  CONSTRAINT [DF_TabMenu_Enable]  DEFAULT ((1)) FOR [Enable]
GO
