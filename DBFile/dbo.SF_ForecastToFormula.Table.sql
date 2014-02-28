USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[SF_ForecastToFormula]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF_ForecastToFormula](
	[StoreID] [int] NOT NULL,
	[ForecastID] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
	[EditorName] [nvarchar](50) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_SF_ForecastToFormula_1] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
