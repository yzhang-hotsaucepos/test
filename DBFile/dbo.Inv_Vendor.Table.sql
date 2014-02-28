USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Vendor]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Vendor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Supplier] [bit] NULL,
	[TenderTypes] [nvarchar](max) NOT NULL,
	[Contact] [nvarchar](100) NULL,
	[Archived] [bit] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
	[VendorStore] [nvarchar](max) NULL,
	[DisplaySeq] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inventory_Vendor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
