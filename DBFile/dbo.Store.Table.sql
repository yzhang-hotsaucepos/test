USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[LocationID] [nvarchar](50) NOT NULL,
	[StoreNumber] [nvarchar](20) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Address Cont.] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State/Province] [nvarchar](50) NULL,
	[Zip/Postal Code] [nvarchar](20) NULL,
 CONSTRAINT [IX_Store] UNIQUE NONCLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
