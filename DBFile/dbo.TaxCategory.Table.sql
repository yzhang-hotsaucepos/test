USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[TaxCategory]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxCategory](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Rate] [decimal](18, 4) NULL,
	[IsInclusive] [bit] NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_TaxCategory] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC,
	[Category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaxCategory]  WITH CHECK ADD  CONSTRAINT [CK_TaxCategory] CHECK  (([category]='tax' OR [category]='sur'))
GO
ALTER TABLE [dbo].[TaxCategory] CHECK CONSTRAINT [CK_TaxCategory]
GO
