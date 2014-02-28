USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[QB_EventType]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QB_EventType](
	[RefNum] [int] NOT NULL,
	[EventDataType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QB_EventType] PRIMARY KEY CLUSTERED 
(
	[RefNum] ASC,
	[EventDataType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QB_EventType]  WITH CHECK ADD  CONSTRAINT [FK_QB_EventType_QB_Event] FOREIGN KEY([RefNum])
REFERENCES [dbo].[QB_Event] ([RefNum])
GO
ALTER TABLE [dbo].[QB_EventType] CHECK CONSTRAINT [FK_QB_EventType_QB_Event]
GO
