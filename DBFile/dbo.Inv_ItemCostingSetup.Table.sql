USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_ItemCostingSetup]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_ItemCostingSetup](
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NULL,
	[LastUpdate] [datetime] NULL,
	[Creator] [int] NOT NULL,
	[Editor] [int] NULL,
 CONSTRAINT [PK_Inv_ItemCostingSetup] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
