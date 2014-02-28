USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[EnterpriseUser]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnterpriseUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsManager] [bit] NULL,
	[Email] [nvarchar](200) NOT NULL,
	[HomePhone] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[MobileCarrier] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[AddressCont] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[SendEmailWhen] [int] NOT NULL,
	[SendMessageWhen] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LoginCount] [int] NOT NULL,
	[IsTerminated] [bit] NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_EnterpriseEmplyee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnterpriseUser', @level2type=N'COLUMN',@level2name=N'ID'
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF_EnterpriseUser_MobileCarrier]  DEFAULT ((1)) FOR [MobileCarrier]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF_EnterpriseUser_SendEmailWhen]  DEFAULT ((0)) FOR [SendEmailWhen]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF_EnterpriseUser_SendMessageWhen]  DEFAULT ((0)) FOR [SendMessageWhen]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF_EnterpriseUser_LoginCount]  DEFAULT ((0)) FOR [LoginCount]
GO
