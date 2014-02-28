USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ReportParameter]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportParameter](
	[ParaID] [int] NOT NULL,
	[ReportDetailID] [int] NOT NULL,
	[ParaName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ReportParameter] PRIMARY KEY CLUSTERED 
(
	[ParaID] ASC,
	[ReportDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportParameter]  WITH CHECK ADD  CONSTRAINT [FK_ReportParameter_ReportDetail] FOREIGN KEY([ReportDetailID])
REFERENCES [dbo].[ReportDetail] ([ID])
GO
ALTER TABLE [dbo].[ReportParameter] CHECK CONSTRAINT [FK_ReportParameter_ReportDetail]
GO
