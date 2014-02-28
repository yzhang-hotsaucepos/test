USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemCategory]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ParentID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[GLAccount] [nvarchar](200) NULL,
	[DisplaySeq] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
	[Layer] [int] NULL,
 CONSTRAINT [PK_Inv_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_ItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_ItemCategory_Inv_ItemGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Inv_ItemGroup] ([ID])
GO
ALTER TABLE [dbo].[Inv_ItemCategory] CHECK CONSTRAINT [FK_Inv_ItemCategory_Inv_ItemGroup]
GO
