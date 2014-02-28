USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
