USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ReportDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDetail](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](200) NULL,
	[ReportListID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
 CONSTRAINT [PK_ReportDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReportDetail_ReportList] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([ID])
GO
ALTER TABLE [dbo].[ReportDetail] CHECK CONSTRAINT [FK_ReportDetail_ReportList]
GO
