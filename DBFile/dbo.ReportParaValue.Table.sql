USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ReportParaValue]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportParaValue](
	[SubscriptionID] [int] NOT NULL,
	[ParameterID] [int] NOT NULL,
	[Value] [nvarchar](2000) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ReportParaValue] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC,
	[ParameterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportParaValue]  WITH CHECK ADD  CONSTRAINT [FK_ReportParaValue_ReportSubscription] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[ReportSubscription] ([ID])
GO
ALTER TABLE [dbo].[ReportParaValue] CHECK CONSTRAINT [FK_ReportParaValue_ReportSubscription]
GO
