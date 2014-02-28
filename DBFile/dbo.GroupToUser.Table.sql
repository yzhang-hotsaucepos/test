USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[GroupToUser]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupToUser](
	[GroupID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_GroupToUser] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupToUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupToUser_EnterpriseUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[EnterpriseUser] ([ID])
GO
ALTER TABLE [dbo].[GroupToUser] CHECK CONSTRAINT [FK_GroupToUser_EnterpriseUser]
GO
ALTER TABLE [dbo].[GroupToUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupToUser_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[GroupToUser] CHECK CONSTRAINT [FK_GroupToUser_Group]
GO
