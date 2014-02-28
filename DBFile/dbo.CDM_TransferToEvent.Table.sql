USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_TransferToEvent]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_TransferToEvent](
	[EventID] [int] NOT NULL,
	[TransferTable] [nvarchar](50) NOT NULL,
	[TransferTableID] [int] NOT NULL,
 CONSTRAINT [PK_CDMTransferToEvent] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[TransferTable] ASC,
	[TransferTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CDM_TransferToEvent]  WITH CHECK ADD  CONSTRAINT [FK_CDMTransferToEvent_CDMTransferEvent] FOREIGN KEY([EventID])
REFERENCES [dbo].[CDM_TransferEvent] ([ID])
GO
ALTER TABLE [dbo].[CDM_TransferToEvent] CHECK CONSTRAINT [FK_CDMTransferToEvent_CDMTransferEvent]
GO
