USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[OrganizationToUser]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationToUser](
	[OrganizationID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_OrganizationToEmployee] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrganizationToUser]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationToEmployee_EnterpriseEmplyee] FOREIGN KEY([UserID])
REFERENCES [dbo].[EnterpriseUser] ([ID])
GO
ALTER TABLE [dbo].[OrganizationToUser] CHECK CONSTRAINT [FK_OrganizationToEmployee_EnterpriseEmplyee]
GO
ALTER TABLE [dbo].[OrganizationToUser]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationToEmployee_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([ID])
GO
ALTER TABLE [dbo].[OrganizationToUser] CHECK CONSTRAINT [FK_OrganizationToEmployee_Organization]
GO
