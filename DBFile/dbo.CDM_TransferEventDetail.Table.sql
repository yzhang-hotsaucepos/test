USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_TransferEventDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_TransferEventDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_CDMTransferEventDetail_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CDM_TransferEventDetail]  WITH CHECK ADD  CONSTRAINT [FK_CDMTransferEventDetail_CDMTransferEvent] FOREIGN KEY([EventID])
REFERENCES [dbo].[CDM_TransferEvent] ([ID])
GO
ALTER TABLE [dbo].[CDM_TransferEventDetail] CHECK CONSTRAINT [FK_CDMTransferEventDetail_CDMTransferEvent]
GO
