USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ReportSubscription]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportSubscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ReportDetailID] [int] NULL,
	[Frequency] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SendTime] [datetime] NULL,
	[SendToMe] [bit] NULL,
	[SendTo] [nvarchar](max) NULL,
	[FileType] [nvarchar](20) NULL,
	[LastSendDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportSubscription]  WITH CHECK ADD  CONSTRAINT [FK_ReportSubscription_ReportDetail] FOREIGN KEY([ReportDetailID])
REFERENCES [dbo].[ReportDetail] ([ID])
GO
ALTER TABLE [dbo].[ReportSubscription] CHECK CONSTRAINT [FK_ReportSubscription_ReportDetail]
GO
