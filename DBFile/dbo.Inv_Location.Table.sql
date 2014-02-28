USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_Location]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DisplaySeq] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
	[Layer] [int] NULL,
 CONSTRAINT [PK_Inv_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
