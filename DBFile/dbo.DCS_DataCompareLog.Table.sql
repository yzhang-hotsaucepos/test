USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DCS_DataCompareLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCS_DataCompareLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[CompareDate] [datetime] NULL,
 CONSTRAINT [PK_DataCompareLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
