USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_TransferEventErrorLog]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_TransferEventErrorLog](
	[EventDetailID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ErrorTable] [int] NOT NULL,
	[ErrorID] [int] NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_CDMTransferEventErrorLog] PRIMARY KEY CLUSTERED 
(
	[EventDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'New,Close' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CDM_TransferEventErrorLog', @level2type=N'COLUMN',@level2name=N'Status'
GO
ALTER TABLE [dbo].[CDM_TransferEventErrorLog]  WITH CHECK ADD  CONSTRAINT [FK_CDMTransferEventErrorLog_CDMTransferEventDetail] FOREIGN KEY([EventDetailID])
REFERENCES [dbo].[CDM_TransferEventDetail] ([ID])
GO
ALTER TABLE [dbo].[CDM_TransferEventErrorLog] CHECK CONSTRAINT [FK_CDMTransferEventErrorLog_CDMTransferEventDetail]
GO
