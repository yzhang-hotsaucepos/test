USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ConstTable]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstTable](
	[Category] [nvarchar](50) NOT NULL,
	[ID] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Describe] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConstString_1] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[ID] ASC,
	[Value] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConstTable] ADD  CONSTRAINT [DF_ConstString_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
