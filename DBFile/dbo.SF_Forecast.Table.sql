USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[SF_Forecast]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF_Forecast](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[EditorID] [int] NOT NULL,
	[EditorName] [nvarchar](200) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_SF_SalesForecast] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
