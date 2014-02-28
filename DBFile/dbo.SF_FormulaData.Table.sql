USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[SF_FormulaData]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF_FormulaData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[DayPart] [nvarchar](200) NOT NULL,
	[ForecastsDate] [datetime] NOT NULL,
	[ForecastValue] [decimal](18, 2) NOT NULL,
	[ModifyValue] [decimal](18, 2) NULL,
	[EditorID] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_SF_FormulaData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
