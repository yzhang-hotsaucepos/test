USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborTimeOff]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborTimeOff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[ApplicantID] [int] NOT NULL,
	[ApprovedBy] [nvarchar](50) NOT NULL,
	[ApprovedTime] [datetime] NULL,
	[RequestTime] [datetime] NULL,
 CONSTRAINT [PK_LaborTimeOff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
