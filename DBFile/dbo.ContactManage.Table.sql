USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ContactManage]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactManage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[WorkPhone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[AddressCont] [nvarchar](50) NULL,
	[City] [nvarchar](20) NULL,
	[StateOrProvince] [nvarchar](50) NULL,
	[ZipOrPostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[WhoCanView] [int] NULL,
	[CreateUserID] [int] NULL,
	[StoreID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_ContactManager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
