USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[SF_Formulas]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF_Formulas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ForecastID] [int] NOT NULL,
	[Percentage] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[EditorID] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[EditorName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_SF_SalesForecastFormulas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SF_Formulas]  WITH CHECK ADD  CONSTRAINT [FK_SF_SalesForecastFormulas_SF_SalesForecast] FOREIGN KEY([ForecastID])
REFERENCES [dbo].[SF_Forecast] ([ID])
GO
ALTER TABLE [dbo].[SF_Formulas] CHECK CONSTRAINT [FK_SF_SalesForecastFormulas_SF_SalesForecast]
GO
