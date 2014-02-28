USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[SF_FormulaToStore]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF_FormulaToStore](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ForecastID] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_SF_ForecastToFormula] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SF_FormulaToStore]  WITH CHECK ADD  CONSTRAINT [FK_SF_ForecastToFormula_SF_Forecast] FOREIGN KEY([ForecastID])
REFERENCES [dbo].[SF_Forecast] ([ID])
GO
ALTER TABLE [dbo].[SF_FormulaToStore] CHECK CONSTRAINT [FK_SF_ForecastToFormula_SF_Forecast]
GO
