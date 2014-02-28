USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[QB_Event]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QB_Event](
	[RefNum] [int] IDENTITY(1,1) NOT NULL,
	[ProfileID] [int] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[State] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
	[EditorName] [nvarchar](50) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[DownLoadUserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_QB_Event_1] PRIMARY KEY CLUSTERED 
(
	[RefNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QB_Event]  WITH CHECK ADD  CONSTRAINT [FK_QB_Event_QB_Event] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[QB_Profile] ([ID])
GO
ALTER TABLE [dbo].[QB_Event] CHECK CONSTRAINT [FK_QB_Event_QB_Event]
GO
