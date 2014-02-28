USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ManagerLogDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerLogDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeaderID] [int] NOT NULL,
	[ManagerLogID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Flag] [bit] NOT NULL,
	[LogEntry] [text] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ManagerLogDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ManagerLogDetail]  WITH CHECK ADD  CONSTRAINT [FK_ManagerLogDetail_ManagerLog] FOREIGN KEY([ManagerLogID])
REFERENCES [dbo].[ManagerLog] ([ID])
GO
ALTER TABLE [dbo].[ManagerLogDetail] CHECK CONSTRAINT [FK_ManagerLogDetail_ManagerLog]
GO
ALTER TABLE [dbo].[ManagerLogDetail] ADD  CONSTRAINT [DF_ManagerLogDetail_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
