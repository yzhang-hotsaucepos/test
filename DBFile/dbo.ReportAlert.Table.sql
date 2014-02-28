USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ReportAlert]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportAlert](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlertName] [nvarchar](50) NOT NULL,
	[TriggerBelowValues] [nvarchar](20) NULL,
	[TriggerAboveValues] [nvarchar](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[AlertFrequency] [int] NOT NULL,
	[SendtoStore] [nvarchar](max) NOT NULL,
	[LastSendDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Sendto] [nvarchar](10) NULL,
 CONSTRAINT [PK_ReportAlert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
